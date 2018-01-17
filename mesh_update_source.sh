#!/bin/sh

set -x
git pull
SOURCE_DIR=compat-wireless
mkdir -p ${SOURCE_DIR}
test -d ${SOURCE_DIR}/.git && _=`cd ${SOURCE_DIR} && git pull` || {
    git clone https://gitlab.com/QilunWireless/compat-wireless.git ${SOURCE_DIR}
}

set +x
