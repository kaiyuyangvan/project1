#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Error: no augument provided "
        echo "usage: $0 backup_sql_file"
        exit 1
fi

echo "Will restore backup database from:" $1
mysql -uroot -proot -e "show databases" | grep -v Database | grep -v mysql | grep -v information_schema | gawk '{print "drop database " $1 ";select sleep(0.1);" }' | mysql -uroot -proot
echo "Clean all databases before restore"
mysql -uroot -proot -e "show databases"
echo "Restore Backupfile from $1 "
mysql -uroot -proot < $1
echo " All databases after restore"
mysql -uroot -proot -e "show databases"
