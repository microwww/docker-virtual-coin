#!/bin/sh
set -e

ofile="/root/.ethereum/OPTIONS"
if [ ! -f "$ofile" ];then
    mkdir -p /root/.ethereum/
    echo ''  > ${ofile}
fi

OPTIONS=`cat ${ofile}`

exec /usr/local/bin/geth ${OPTIONS} $@
#exec /bin/bash
