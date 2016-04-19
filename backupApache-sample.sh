#!/bin/bash

# SSH VARIABLES
SSHHOST=""
SSHUSER=""
SSHPASS=""
SSHPORT=""


data=`date "+%Y%m%d"`
tar zcvf /home/felix/BackupHospedagem-$data.tar.gz /home/* -R --exclude /home/felix
tar zcvf /home/felix/BackupHospedagemConf-$data.tar.gz /etc/apache2/* -R

# upload backup files
sshpass -p $SSHPASS scp -P $SSHPORT /home/felix/BackupHospedagem-$data.tar.gz $SSHUSER@$SSHHOST:/home/felix/Backups/
sshpass -p $SSHPASS scp -P $SSHPORT /home/felix/BackupHospedagemConf-$data.tar.gz $SSHUSER@$SSHHOST:/home/felix/Backups/

# exclude local backup files
rm -rf /home/felix/BackupHospedagem-$data.tar.gz
rm -rf /home/felix/BackupHospedagemConf-$data.tar.gz
