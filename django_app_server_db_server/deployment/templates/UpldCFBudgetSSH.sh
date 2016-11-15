#!/bin/bash
#
# upload_budget.sh 
# Purpose : to download the daily budget balance from SAGA Server thru SAGA web server
set -x

SOURCE=/appl/iface
FILENAME="budget-"`date +%d%m%Y`".txt"
HOSTNAME="{{ ansible_eth0.ipv4.address }}"

DBNAME=$1
USER=postgres
export PGLIB PGDATA
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
truncate tmp_budget cascade;
truncate integrations_budget cascade;
truncate integrations_accountremain cascade;
copy tmp_budget from '$SOURCE/$FILENAME' with delimiter '|';
INSERT INTO integrations_budget (bcac_account,bcac_amount,bcac_monitorglac,bcac_status,bcac_warnflag) SELECT bcac_account,bcac_amount,bcac_monitorglac,bcac_status,bcac_warnflag FROM tmp_budget;
INSERT INTO integrations_accountremain (eccr_account,eccr_remain) SELECT bcac_monitorglac,bcac_amount FROM tmp_budget;
EOT
else
	echo "-- "`date`		>> /tmp/budget_dwld.log
	echo "-- Download budget infomartion from SAGA success with 0 records." 	>> /tmp/budget_dwld.log
	echo "-- Nothing to upload." 	>> /tmp/budget_dwld.log
	exit 1
fi
