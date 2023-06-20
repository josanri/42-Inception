# Change password for user
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
# Delete empty user
DELETE FROM mysql.user WHERE User='';
# Disallow remote root
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# Delete test database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# Kill the anonymous users
DROP USER IF EXISTS ''@'localhost';
# Because our hostname varies we'll use some Bash magic here.
DROP USER IF EXISTS ''@'$(hostname)';

# Configurating Wordpress database
CREATE DATABASE $MYSQL_DB_NAME

GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* to $MYSQL_USER@nginx identified by '$MYSQL_PASSWORD';


# Make our changes take effect
FLUSH PRIVILEGES;