#!/bin/sh /etc/rc.common
# Copyright (C) 2016 Weongyo Jeong

START=50

USE_PROCD=1
VERSION=`cat /etc/mudfish-pi/version`
MUDRUN_BIN="/opt/mudfish-pi/${VERSION}/bin/mudrun"

start_instance()
{
        procd_open_instance
        procd_set_param respawn
        procd_set_param stderr 1
        procd_set_param command "$MUDRUN_BIN" -a $(uci get network.lan.ipaddr)
        procd_close_instance
}

service_triggers()
{
        procd_add_reload_trigger "mudfish-pi"
}

start_service() {
        config_load mudfish-pi
        config_foreach start_instance mudfish-pi
}

section_enabled() {
	config_get_bool enable  "$1" 'enable'  0
	config_get_bool enabled "$1" 'enabled' 0
	[ $enable -gt 0 ] || [ $enabled -gt 0 ]
}

