#!/bin/bash

# Attendre que MySQL soit prêt
until mysql -u"root" -p"root" -e "SELECT 1"; do
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 1
done

>&2 echo "MySQL is up - executing script"

# Exécuter le script SQL
mysql -u"root" -p"root" < init.sql
