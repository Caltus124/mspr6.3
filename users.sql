CREATE USER 'grafana'@'172.19.0.4' IDENTIFIED BY 'admin';
GRANT SELECT ON app_db.* TO 'grafana'@'172.19.0.4';

FLUSH PRIVILEGES;
SELECT user,host FROM mysql.user;
