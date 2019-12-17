#!/bin/sh
set -e

mkdir -p /root/.ethereum/

if [ ! -f "/root/.ethereum/OPTIONS" ];then
    echo '--datadir=/root/.ethereum/ --rpcaddr 0.0.0.0 --rpc --rpcapi db,eth,net,web3'  > /root/.ethereum/OPTIONS
fi

OPTIONS=`cat /root/.ethereum/OPTIONS`

exec /usr/local/bin/geth ${OPTIONS} $@
## /bin/sh

