#!/bin/sh

TOPDIR=/opt/mudfish.net/htdocs/releases/openwrt

scp ./bin/ar71xx/packages/base/mudfish-pi_2.1.13-5_ar71xx.ipk \
    kt.kr.n.loxch.com:${TOPDIR}/chaos_calmer/15.05.1/ar71xx/packages/base

scp ./bin/ar71xx/packages/luci/luci-app-mudfish-pi_git-*.ipk \
    kt.kr.n.loxch.com:${TOPDIR}/chaos_calmer/15.05.1/ar71xx/packages/luci

