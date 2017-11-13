#!/bin/bash

###############################################################
# using this script before "./feeds/scripts update/install -a".
###############################################################

exit_usage() {
    cat <<EOF
    Usage: ./feeds_conf.sh target
    Example: ./feeds_conf.sh MPP_ipq4019
EOF
    exit 1
}

[ -f "feeds_config/release" ] || {
    echo -e "\e[1;m  nonexist file: feeds_config/release! \e[0m"
    exit_usage
}

release=`cat feeds_config/release 2>/dev/null`
target="$1"

[ -z "$release" -o -z "$target" ] && exit_usage

file=./feeds_config/"$release"/"$target"/feeds.conf

[ -e "$file" ] && cp $file . || exit_usage





