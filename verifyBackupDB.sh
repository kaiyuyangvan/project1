#!/bin/bash
if [ $# -lt 2 ]; then
	echo "Error: Two augument need to be provided "
        echo "usage: $0 backup_sql_file root_passwd"
        exit 1
fi

echo "Will restore backup database from:" $1
mysql -uroot -p$2 -e "show databases" | grep -v Database | grep -v mysql | grep -v information_schema | gawk '{print "drop database " $1 ";select sleep(0.1);" }' | mysql -uroot -p$2
echo "Clean all databases before restore"
mysql -uroot -p$2 -e "show databases"
echo "Restore Backupfile from $1 "
mysql -uroot -p$2 < $1
echo " All databases after restore"
mysql -uroot -p$2 -e "show databases"
