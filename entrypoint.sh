#!/bin/sh
set -e

ofile="/root/.dogecoin/OPTIONS"
if [ ! -f "$ofile" ];then
    mkdir -p /root/.dogecoin/
    echo ''  > ${ofile}
fi

OPTIONS=`cat ${ofile}`

exec /usr/local/bin/dogecoind ${OPTIONS} $@
## /bin/bash
