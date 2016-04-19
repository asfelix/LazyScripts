DATA=`/bin/date +%Y%m%d`

# MySQL variables
MYSQLHOST=""
MYSQLUSER=""
MYSQLPASSWORD=''
#

# SSH variables
SSHHOST=""
SSHUSER=""
SSHPASSWORD=""

for i in $(mysql -h $MYSQLHOST -u $MYSQLUSER -p$MYSQLPASSWORD -e 'show databases; |grep -v Database |grep -v information_schema'); do
	file="/home/felix/dumps/$i-$DATA.sql"
	DATABASE="$i"
	mysqldump -h $MYSQLHOST -u $MYSQLUSER -p$MYSQLPASSWORD $i > $file

	sleep 15

	sshpass -p $SSHPASSWORD scp -P 64322 $file $SSHUSER@$SSHHOST:/home/felix/Backups/ ;

done

rm /home/felix/dumps/*.sql
