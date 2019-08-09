#!/bin/sh                                                                                                                                                                      
set -e

time_file=/tmp/time
if [ ! -f "$time_file" ]; then
    date +%s > $time_file
fi

export block_time=`head -n1 $time_file`

time=`date +%s`
next=`expr $time - $block_time`
if [ $next -ge "$INTERVAL" ]; then
    address_file=/tmp/address
    if [ ! -f $address_file ]; then
        bitcoin-cli --regtest=1 getnewaddress > $address_file
    fi
    address=`head -n1 $address_file`
    bitcoin-cli --regtest=1 generatetoaddress 1 $address
    echo $time > $time_file
fi
