#!/bin/bash
 
# Usage: ./compression_estimator.sh mysql
 
TMPCOLUMNS=/tmp/columns.txt
RESULTS=/tmp/compression_estimates.txt
COMPESTCNF=/tmp/my.compest.cnf
 
# COMPESTCNF is a conf file with the following
#
# [client]
# user=username
# password=secretpassword
#
# Be sure this file is only readable by the user executing this script. 
# User must have select privileges on information_schema and the database
# you are estimating.
 
 
 
if [ "$1" == "-h" ] || [ -z "$1" ]; then
  echo "Usage: `basename $0` [DATABASE_NAME]"
  exit 0
fi
 
if [ -f $RESULTS] ; then
rm -f $RESULTS
fi
 
mysql --defaults-file=$COMPESTCNF -e "SELECT CONCAT(table_schema,',',table_name,',',column_name) FROM information_schema.columns WHERE table_schema = '$1' " --skip-column-names > $TMPCOLUMNS
 
mysql --defaults-file=$COMPESTCNF -e "SELECT 'schema_name', 'table_name', 'column_name', 'uncompressed', 'compressed' " --skip-column-names >> $RESULTS
 
while IFS=, read f1 f2 f3; do
            mysql --defaults-file=$COMPESTCNF -e "SELECT '$f1' AS schema_name, '$f2' AS table_name, '$f3' AS column_name, AVG(LENGTH($f3)) AS uncompressed, AVG(LENGTH(COMPRESS($f3))) AS compressed FROM $f1.$f2" --skip-column-names >> $RESULTS
done < $TMPCOLUMNS
 
exit 
