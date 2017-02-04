#!/bin/sh


/etc/init.d/rsyslog start

P=`openssl passwd -apr1 $PASS`

unset noclobber

if [ -f /etc/squid3/passwords ];
	then echo $USER:$P >> /etc/squid3/passwords
	else echo $USER:$P > /etc/squid3/passwords
fi

squid3 -Nd1
