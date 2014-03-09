#!/bin/bash

if [ ! -f /var/lib/mysqlibdata1 ]; then
    /usr/bin/mysql_install_db --user=mysql --ldata=/var/lib/mysql

    /usr/bin/mysqld_safe &
    sleep 10s

    echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'changeme' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

    killall mysqld
    sleep 10s
fi

