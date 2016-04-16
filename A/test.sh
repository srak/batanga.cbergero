#!/bin/bash

MAIL="carlos.bergero@vera.com.uy";
LOGS="./output.log";
CURL=`which curl`;
DIG=`which dig`;
GREP=`which grep`;
AWK=`which awk`;
DATE=`which date`;

if [ -e $CURL ] && [ -n "$CURL" ] && [ -e $DIG ] && [ -n "$DIG" ] && [ -e $GREP ] && [ -n "$GREP" ] && [ -e $AWK ] && [ -n "$AWK" ] && [ -e $DATE ] && [ -n "$DATE" ] ;
then
	echo "Starting - " `$DATE +%Y%m%d%H%M.%s` >> $LOGS;
	for IP in $($DIG www.imujer.com |$GREP A |$GREP -v \;|$GREP -v CNAME |$GREP -v AAA|$AWK '{print$5}');
	do
		echo "Conection IP: " $IP >> $LOGS;
		$CURL -sG http://199.34.125.35/test?email=$MAIL\&record=$IP >> $LOGS;
	done;
	
	echo "Ending - "`$DATE +%Y%m%d%H%M.%s` >> $LOGS;
else
	echo "No pude encontrar las aplicaciones dig, grep, awk, date o curl,"
	echo "deben estar instaladas y dentro de un path accesible";
	exit 1
fi
exit 0

#EOF