USE app_db;

DROP TABLE IF EXISTS licence;
DROP TABLE IF EXISTS type_end;
DROP TABLE IF EXISTS prestataire;
DROP TABLE IF EXISTS techniciens;
DROP TABLE IF EXISTS password;
DROP TABLE IF EXISTS metric;
DROP TABLE IF EXISTS instance;
DROP TABLE IF EXISTS redemarage;
DROP TABLE IF EXISTS problemes;
DROP TABLE IF EXISTS info_instance;

CREATE TABLE `licence` (
  `id_licence` int PRIMARY KEY AUTO_INCREMENT,
  `id_instance` int,
  `start_date` date,
  `end_date` date NOT NULL,
  `id_type_end` int
);

CREATE TABLE `type_end` (
  `id_type_end` int PRIMARY KEY AUTO_INCREMENT,
  `finally_type_end` enum('rupture', 'end contrat'),
  `reel_date_end` date
);

CREATE TABLE `prestataire` (
  `id_prestataire` int PRIMARY KEY AUTO_INCREMENT,
  `nom_societe` varchar(100) NOT NULL,
  `num_tel` varchar(20),
  `index_tel` varchar(5),
  `mail` varchar(200),
  `siret` varchar(50),
  `address` varchar(200),
  `num_voix` int(4),
  `ville` varchar(200),
  `code_postal` int(7)
);

CREATE TABLE `techniciens` (
  `id_utilisateur` int PRIMARY KEY AUTO_INCREMENT,
  `id_prestataire` int,
  `nom` varchar(50),
  `prenom` varchar(50),
  `num_tel` varchar(20),
  `index_tel` varchar(5),
  `mail` varchar(100),
  `username` varchar(50) UNIQUE NOT NULL,
  `id_password` int UNIQUE NOT NULL
);

CREATE TABLE `password` (
  `id_password` int PRIMARY KEY AUTO_INCREMENT,
  `hash_pass` varchar(254) NOT NULL
);

CREATE TABLE `instance` (
  `id_instance` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `num_serie` varchar(200) UNIQUE NOT NULL,
  `storage_type` enum('SSD', 'HDD', 'SSHD', 'SATA', 'SAS') NOT NULL,
  `version_os` varchar(20) NOT NULL,
  `version_harvester` varchar(20) NOT NULL,
  `IP` varchar(40) NOT NULL,
  `IP_VPN` varchar(40),
  `status_harvester` enum('oui', 'non'),
  `state` enum('connecte', 'deconnecte', 'inconnu')
);


CREATE TABLE `metric` (
  `id_metric` int PRIMARY KEY AUTO_INCREMENT,
  `id_instance` int,
  `ram_usage` float,
  `cpu_usage` float,
  `storage_used` float,
  `heure` timestamp
);

CREATE TABLE `redemarage` (
  `id_redemarage` int PRIMARY KEY AUTO_INCREMENT,
  `id_instance` int,
  `heure_redemarage` datetime,
  `log_redemarage` text,
  `heure_de_rentree` timestamp
);

CREATE TABLE `problemes` (
  `id_problemes` int PRIMARY KEY AUTO_INCREMENT,
  `id_instance` int,
  `id_techniciens` int,
  `heure_pb` datetime,
  `log_pb` text
);

CREATE TABLE `info_instance` (
  `id_info_instance` int PRIMARY KEY AUTO_INCREMENT,
  `id_instance` int,
  `location` enum('oui', 'non'),
  `restitue` enum('oui', 'non'),
  `id_loueur` int
);

ALTER TABLE `licence` ADD FOREIGN KEY (`id_instance`) REFERENCES `instance` (`id_instance`);

ALTER TABLE `licence` ADD FOREIGN KEY (`id_type_end`) REFERENCES `type_end` (`id_type_end`);

ALTER TABLE `techniciens` ADD FOREIGN KEY (`id_prestataire`) REFERENCES `prestataire` (`id_prestataire`);

ALTER TABLE `techniciens` ADD FOREIGN KEY (`id_password`) REFERENCES `password` (`id_password`);

ALTER TABLE `metric` ADD FOREIGN KEY (`id_instance`) REFERENCES `instance` (`id_instance`);

ALTER TABLE `redemarage` ADD FOREIGN KEY (`id_instance`) REFERENCES `instance` (`id_instance`);

ALTER TABLE `problemes` ADD FOREIGN KEY (`id_instance`) REFERENCES `instance` (`id_instance`);

ALTER TABLE `problemes` ADD FOREIGN KEY (`id_techniciens`) REFERENCES `techniciens` (`id_utilisateur`);

ALTER TABLE `info_instance` ADD FOREIGN KEY (`id_instance`) REFERENCES `instance` (`id_instance`);

ALTER TABLE `info_instance` ADD FOREIGN KEY (`id_loueur`) REFERENCES `prestataire` (`id_prestataire`);
