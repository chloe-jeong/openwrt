#!/bin/sh

grep "Mudfish PI" /tmp/resolv.conf.auto.backup > /dev/null
if [ $? = 0 ]; then
	/etc/init.d/dnsmasq restart
else
	/bin/cp -f /tmp/resolv.conf.auto.backup /tmp/resolv.conf.auto
	/usr/bin/killall -HUP dnsmasq
fi
