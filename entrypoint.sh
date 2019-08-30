#!/bin/sh
set -e

ofile="/root/.bitcoin/OPTIONS"
if [ ! -f "$ofile" ];then
    mkdir -p /root/.bitcoin/
    echo ''  > ${ofile}
fi

OPTIONS=`cat ${ofile}`

#exec /usr/local/bin/dogecoin-cli ${OPTIONS} $@
/bin/sh
