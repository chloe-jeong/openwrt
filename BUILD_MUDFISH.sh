#!/bin/sh

make V=s USE_SOURCE_DIR=/home/weongyo/Sources/ttol/head/mudfish/ \
    package/network/services/mudfish/clean

make V=s USE_SOURCE_DIR=/home/weongyo/Sources/ttol/head/mudfish/ \
    package/network/services/mudfish/prepare

make V=s USE_SOURCE_DIR=/home/weongyo/Sources/ttol/head/mudfish/ \
    package/network/services/mudfish/compile
