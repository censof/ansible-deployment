#!/bin/bash
#
# UpldCFEmploy.sh 
# Purpose : to download the daily  employee details changes from SAGA Server thru SAGA web server and upload into eClaim tmp_hrms table

SOURCE=/appl/iface
FILENAME="staf-"`date +%d%m%Y`".txt"
HOSTNAME="{{ ansible_eth0.ipv4.address }}"

DBNAME=$1
USER=postgres
export PATH=/opt/postgres/9.3/bin:$PATH
export PGDATA=/pgdata/postgres/9.3
export PGDATABASE=postgres
export PGUSER=postgres
export PGPORT=5432
export PGLOCALEDIR=/opt/postgres/9.3/share/locale
export MANPATH=$MANPATH:/opt/postgres/9.3/share/man

if [ -s $SOURCE/$FILENAME  ]
then
psql -h $HOSTNAME -d $DBNAME -U $USER -w <<EOT
truncate tmp_hrms cascade;
copy tmp_hrms from '$SOURCE/$FILENAME' with delimiter '|';
EOT
else
	echo "-- "`date`		>> /tmp/staf_dwld.log
	echo "-- Download staf information from SAGA success with 0 records." 	>> /tmp/staf_dwld.log
	echo "-- Nothing to upload." 	>> /tmp/staf_dwld.log
	exit 1
fi

#rm $SOURCE/$FILENAME
