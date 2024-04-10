#!/bin/bash

# Attendre que MySQL soit prêt
until mysql -h"localhost" -P"6033" -u"admin" -p"admin" -e "SELECT 1"; do
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 1
done

>&2 echo "MySQL is up - executing script"

# Exécuter le script SQL
mysql -h"localhost" -P"6033" -u"admin" -p"admin" < init.sql
