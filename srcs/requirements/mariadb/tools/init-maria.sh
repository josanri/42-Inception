#!/bin/bash

set -e

# Change password for user
mysql -sfu root -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';"
# Delete empty user
mysql -sfu root -e "DELETE FROM mysql.user WHERE User='';"
# Disallow remote root
mysql -sfu root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# Delete test database
mysql -sfu root -e "DROP DATABASE IF EXISTS test;"

mysql -sfu root -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# Kill the anonymous users
mysql -sfu root -e "DROP USER IF EXISTS ''@'localhost';"
# Because our hostname varies we'll use some Bash magic here.
mysql -sfu root -e "DROP USER IF EXISTS ''@'$(hostname)';"

# Configurating Wordpress database
mysql -sfu root -e "DROP DATABASE IF EXISTS $MYSQL_DB_NAME;"
mysql -sfu root -e "CREATE DATABASE $MYSQL_DB_NAME;"

mysql -sfu root -e "DROP USER IF EXISTS '$MYSQL_USER';"
mysql -sfu root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';"
mysql -sfu root -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';"


mysql -sfu root -e "SHOW DATABASES;" > result.txt
mysql -sfu root -e "SELECT User, Host, Password FROM mysql.user;" >> result.txt


# Make our changes take effect
mysql -sfu root -e "FLUSH PRIVILEGES;"
