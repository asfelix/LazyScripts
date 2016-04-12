DATA=`/bin/date +%Y-%m-%d`

# variáveis do MySQL
HOST=""
USER=""
PASSWORD=''
#

for i in $(mysql -h $HOST -u $USER -p$PASSWORD -e 'show databases;'); do
	banco="/home/felix/dumps/$i-$DATA.sql"
	DATABASE="$i"
	mysqldump -h $HOST -u $USER -p$PASSWORD $i > $banco

	sleep 15;
done
