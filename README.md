# mspr6.3

## Installation

### Docker Installation

To install the necessary components using Docker, execute the following command:

```bash
sudo docker-compose up -d
```

### Database Setup

Once Docker is up and running, execute the following steps to set up the database and create an account for Grafana:

1. Access the Docker container for the database:
   ```bash
   sudo docker exec -it db bash
   ```

2. Run the initialization script:
   ```bash
   ./init_db.sh
   ```

3. Log in to MySQL:
   ```bash
   mysql -u root -p
   ```

4. Inside the MySQL shell, execute the following commands to create a user for Grafana and grant necessary privileges:
   ```sql
   CREATE USER 'grafana'@'IP-DB' IDENTIFIED BY 'admin';
   GRANT SELECT ON app_db.* TO 'grafana'@'IP-DB';
   FLUSH PRIVILEGES;
   ```
   Replace `'IP-DB'` with the appropriate IP address or hostname of your database server.

## Connection

### Accessing PHPMyAdmin

You can access PHPMyAdmin by navigating to the following URL in your web browser:
```
http://localhost:8081
```

### Accessing Grafana

To access Grafana, use the following URL:
```
http://localhost:3000
```

### Connecting to MySQL Database via Command Line

You can connect to the MySQL database using the following command:
```bash
mysql -h 127.0.0.1 -P 6033 -u admin -p
```

Make sure to replace `'admin'` with the appropriate username if different.

Please ensure that Docker is running and configured properly before attempting to access these services. For detailed instructions on setting up Docker and troubleshooting common issues, refer to the Docker documentation.
