#!/bin/bash

cd `dirname $0`

if [ $# -ne 4 ]; 
then
	echo "Usage: $0 IPO_Proprio IPO_Outro IPSNET_Propria IPSNET_Outra"
	exit
fi

for FILE in /etc/racoon/racoon.conf /etc/racoon/psk.txt /etc/ipsec-tools.conf
do
	sed "s_IPO\_Proprio_$1_;s_IPO\_Outro_$2_;s_IPSNET\_Propria_$3_;s_IPSNET\_Outra_$4_" `basename $FILE` > $FILE
	chmod 0600 $FILE
done

/etc/init.d/setkey restart
/etc/init.d/racoon restart