USE app_db;

CREATE TABLE licence (
  id_licence int PRIMARY KEY AUTO_INCREMENT,
  id_instance int,
  start_date date,
  end_date date NOT NULL
);

CREATE TABLE prestataire (
  id_prestataire int PRIMARY KEY AUTO_INCREMENT,
  nom_societe varchar(100) NOT NULL,
  num_tel varchar(20),
  index_tel varchar(5),
  mail varchar(200),
  siret varchar(50),
  address varchar(200),
  num_voix int(4),
  ville varchar(200),
  code_postal int(7)
);

CREATE TABLE users (
  id_utilisateur int PRIMARY KEY AUTO_INCREMENT,
  id_prestataire int,
  nom varchar(50),
  prenom varchar(50),
  num_tel varchar(20),
  index_tel varchar(5),
  mail varchar(100),
  username varchar(50) UNIQUE NOT NULL,
  id_password int UNIQUE NOT NULL
);

CREATE TABLE password (
  id_password int PRIMARY KEY AUTO_INCREMENT,
  hash_pass varchar(254) NOT NULL
);
