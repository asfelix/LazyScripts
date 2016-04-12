DATA=`/bin/date +%Y-%m-%d`

# variáveis do MySQL
MYSQLHOST=""
MYSQLUSER=""
MYSQLPASSWORD=''
#

# variáveis do SSH
SSHHOST=""
SSHUSER=""
SSHPASSWORD=""
SSHPORT

for i in $(mysql -h $MYSQLHOST -u $MYSQLUSER -p$MYSQLPASSWORD -e 'show databases;'); do
	banco="/home/felix/dumps/$i-$DATA.sql"
	DATABASE="$i"
	mysqldump -h $MYSQLHOST -u $MYSQLUSER -p$MYSQLPASSWORD $i > $banco
	
	sshpass -p $SSHPASSWORD scp -P $SSHPORT $banco $SSHUSER@$SSHHOST:/home/felix/Backups/

	sleep 15;
done
