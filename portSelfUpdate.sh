#!/bin/bash
#Must run as root
#This script performs an update of mac port and all of its packages
#Set to run as a cron job by root monthly on the 1st of each month


LOG="/var/log/portselfupdate.log"

if [ -f ${LOG} ]; then
	rm ${LOG}
else
	touch ${LOG}
fi

echo "------------------------------">>${LOG}
date >>$LOG
echo "--------Upgrading Port--------">>${LOG}
port selfupdate 2>> ${LOG} #Update mac ports


echo "-----Upgrading Packages-------">>${LOG}
port upgrade outdated 2>> ${LOG}

UPEXITSTATUS=$? #Exit status of previous command (port upgrade outdated) 

if [ ${UPEXITSTATUS} -eq 1 ]; then #Tests if there were no updates to do
	echo "No ports needed to be updated">>${LOG}
fi

echo "------------Done--------------">>${LOG}

