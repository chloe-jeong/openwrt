#!/bin/sh

OLD_RESOLVFILE="resolv.conf.auto"
OLD_RESOLVPATH="/tmp/$OLD_RESOLVFILE"
NEW_RESOLVFILE="resolv.conf.mudfish"
NEW_RESOLVPATH="/tmp/$NEW_RESOLVFILE"

if [ ! -f "/tmp/resolv.conf.mudfish" ]; then
	echo "[ERROR] No /tmp/resolv.conf.mudfish file exists."
	exit 1
fi
grep "Mudfish PI" /tmp/resolv.conf.auto > /dev/null
if [ $? = 0 ]; then
	echo "[ERROR] Restarting DNSMasq to recover the original."
	/etc/init.d/dnsmasq restart
fi

/bin/cp -f /tmp/resolv.conf.auto /tmp/resolv.conf.auto.backup
/bin/cp -f /tmp/resolv.conf.mudfish /tmp/resolv.conf.auto

/usr/bin/killall -HUP dnsmasq
