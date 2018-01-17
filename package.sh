#!/bin/bash
BASE=`pwd`
MPP=${BASE}/mpp
MP=${BASE}/mp
BRANCH=v3.3-mesh-9563_9886

export FORCE_UNSAFE_CONFIGURE=1

CLEAN=no
OBJ="$1"

Usage() {
    cat <<EOF
    Usage :

        ./package.sh {mpp | mp} [-c]
    option:
        -c         make clean.

EOF
    exit 0
}

err() {
    echo -e "\e[1;38m $TARGET package faild \e[0m"
    exit 1
}

case "$OBJ" in
    mp|mpp);;
    *) Usage;;
esac

[ "$2" = "-c" ] && CLEAN=yes

if [ "$OBJ" = "mpp" ]; then
    DIR=${MPP}
    TARGET=MPP_9563_9886
    PUPPIES=puppies
else
    DIR=${MP}
    TARGET=MP_9563_9886
    PUPPIES=ap_apps_low
fi

cd ${DIR} && {
    git checkout -f .
    git checkout ${BRANCH}
    git pull origin ${BRANCH}
    ./feeds_conf.sh ${TARGET}

    ./scripts/feeds update -a
    ./scripts/feeds install -a

    chmod +x ./feeds/${PUPPIES}/rom/scripts/*
    ./feeds/${PUPPIES}/rom/scripts/mesh_update_source.sh || err
    if [ "$CLEAN" == yes ] ; then make clean ; else echo "NO CLEAN"; fi
    [ $? -eq 0 ] && ./feeds/${PUPPIES}/rom/scripts/make.sh ${TARGET} make V=s || err
}
