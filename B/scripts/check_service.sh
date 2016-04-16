#!/bin/bash

MAIL=`which mail`;
CURL=`which curl`;
if [ -e $CURL ] && [ -n "$CURL" ] ;
then
	CHECK=`$CURL -s nginx.devops.com |grep "Hello World"`;
	if [ -n "$CHECK" ] ;
	then
		exit 0
	else
		echo "Error en el chequeo" | $MAIL -s "Error en el Chequeeo de nginx.devops.com" guzman.braso+sample-alert@batangamedia.com;
		exit 1
	fi
else
	exit 1
fi

#EOF
