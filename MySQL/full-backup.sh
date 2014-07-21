#!/bin/bash
#
# Script to automate the Sql dumping of all MySQL databases
#
# @aymanrb - 2014 / 07 / 03
#

sudo -v

read -p "Enter the username of your MySQL Database (e.g. admin): " MySqlUsername
echo -n "Enter the password for the root MySQL username[$MySqlUsername] (e.g. AdminPsswd): "
read -s MySqlPass


# LOG FILE
BACKUP_LOG_DIR=/var/log
BACKUP_LOG_FILE=$BACKUP_LOG_DIR/mysql_backup.log
if [ ! -d $BACKUP_LOG_DIR ]; then
	sudo mkdir $BACKUP_LOG_DIR
	touch BACKUP_LOG_FILE
fi

# Backup Dir
BACKUP_DIR=/var/mysql_backup/
if [ ! -d $BACKUP_DIR ]; then
	sudo mkdir $BACKUP_DIR
fi

echo "------------------------------------" | sudo tee -a $BACKUP_LOG_FILE > /dev/null
echo "Starting daily backup at `date`" | sudo tee -a $BACKUP_LOG_FILE > /dev/null 

# Backup databases
for db in $(mysql -u$MySqlUsername -p$MySqlPass -N -e 'show databases' | grep -Ev "mysql|information_schema|performance_schema")
do
	mysqldump -u$MySqlUsername -p$MySqlPass --single-transaction $db | sudo gzip -1 | sudo tee $BACKUP_DIR$db-`date +%y%m%d%H%M`.sql.gz 2 | sudo tee -a $BACKUP_LOG_FILE > /dev/null
done

sudo echo "Daily backup done at `date`." | sudo tee -a $BACKUP_LOG_FILE > /dev/null
