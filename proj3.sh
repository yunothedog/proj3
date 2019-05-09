#!/bin/bash

apt-get update
apt-get install -y apache2
apt-get install -y php libapache2-mod-php php-mysql

sudo service apache2 restart

cd /var/www/html
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php

mv adminer-4.3.1-mysql.php adminer.php

apt-get -y install debconf-utils
MYSQL_PASSWD=root
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_PASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_PASSWD"

apt-get install -y mysql-server
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart
mysql -uroot mysql -p$MYSQL_PASSWD <<< "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_PASSWD'; FLUSH PRIVILEGES;"
mysql -uroot mysql -p$MYSQL_PASSWD <<< "CREATE DATABASE Vagrant;"
