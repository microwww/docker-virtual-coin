#!/bin/sh
set -e

ofile="/root/.ethereum-classic/OPTIONS"
if [ ! -f "$ofile" ];then
    mkdir -p /root/.ethereum-classic/
    echo ''  > ${ofile}
fi

OPTIONS=`cat ${ofile}`

exec /usr/local/bin/geth ${OPTIONS} $@
## /bin/sh
