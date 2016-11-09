#!/bin/sh /etc/rc.common
# Copyright (C) 2016 Weongyo Jeong

START=50

USE_PROCD=1
VERSION=`cat /etc/mudfish-pi/version`
MUDRUN_BIN="/opt/mudfish-pi/${VERSION}/bin/mudrun"

append_arg() {
        local cfg="$1"
        local var="$2"
        local opt="$3"
        local def="$4"
        local val

        config_get val "$cfg" "$var"
        [ -n "$val" -o -n "$def" ] && procd_append_param command "$opt" "${val:-$def}"
}

append_bool() {
        local cfg="$1"
        local var="$2"
        local opt="$3"
        local def="$4"
        local val

        config_get_bool val "$cfg" "$var" "$def"
        [ "$val" = 1 ] && procd_append_param command "$opt"
}

start_instance()
{
        procd_open_instance
        procd_set_param respawn
        procd_set_param stderr 1
        procd_set_param command "$MUDRUN_BIN"
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
