#!/bin/sh

TOPDIR=/opt/mudfish.net/htdocs/releases/openwrt

scp ./bin/ramips/packages/base/mudfish-pi_2.1.13-5*.ipk \
    kt.kr.n.loxch.com:${TOPDIR}/snapshots/trunk/ramips/mt7628/packages/base

scp ./bin/ramips/packages/luci/luci-app-mudfish-pi_git-*.ipk \
    kt.kr.n.loxch.com:${TOPDIR}/snapshots/trunk/ramips/mt7628/packages/luci

