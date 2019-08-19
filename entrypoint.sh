#!/bin/sh
set -e

ofile="/root/.bitcoin/OPTIONS"
if [ ! -f "$ofile" ];then
    mkdir -p /root/.bitcoin/
    echo '-txindex'  > ${ofile}
fi

OPTIONS=`cat ${ofile}`

exec /usr/local/bin/omnicored ${OPTIONS} $@
## /bin/sh
