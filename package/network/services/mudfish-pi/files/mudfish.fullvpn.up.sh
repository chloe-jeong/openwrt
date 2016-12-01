#!/bin/sh

RESOLVFILE="/tmp/resolv.conf.mudfish"

if [ ! -f "$RESOLVFILE" ]; then
    echo "No file exists."
    exit 1
fi

sed -i -- 's/resolv.conf.auto/resolv.conf.mudfish/g' \
    /var/etc/dnsmasq.conf

killall dnsmasq
