#! /bin/bash
set -e

MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD:-"mysql"}
MYSQL_USER=${MYSQL_USER:-""}
MYSQL_USER_PWD=${MYSQL_USER_PWD:-""}

echo "Setting up new power user credentials."
service mysql start $ sleep 10

echo "Setting root new password."
mysql --user=root --password=root -e "UPDATE mysql.user set authentication_string=password('$MYSQL_ROOT_PWD') where user='root'; FLUSH PRIVILEGES;"

echo "Setting root remote password."
mysql --user=root --password=$MYSQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

if [ -n "$MYSQL_USER" ] && [ -n "$MYSQL_USER_PWD" ]; then
	echo "Create new User and Password."
	mysql --user=root --password=$MYSQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PWD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

else
	echo "Don\`t need to create new User."
fi

killall mysqld
sleep 5
echo "Setting end,have fun."

exec "$@"