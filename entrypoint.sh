#!/bin/sh
set -e

ofile="/home/${RUN_USER}/.dogecoin/OPTIONS"
if [ ! -f "$ofile" ];then
    mkdir -p /home/${RUN_USER}/.dogecoin/
    echo ''  > ${ofile}
fi

OPTIONS=`cat ${ofile}`

#exec /usr/local/bin/dogecoind ${OPTIONS} $@
/bin/bash
