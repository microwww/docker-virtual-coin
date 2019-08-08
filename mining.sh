#!/bin/sh                                                                                                                                                                      
set -e
block_file=/tmp/eth.block.number
time_file=/tmp/eth.ming.time
if [ ! -f "$block_file" ]; then
    geth attach --exec 'eth.blockNumber' > $block_file
fi
if [ ! -f "$time_file" ]; then
    date +%s > $time_file
fi

export block_number=`head -n1 $block_file`
export block_time=`head -n1 $time_file`

function mining() {
    if [ $1 -lt 5 ]; then
        local num=`geth attach --exec 'eth.blockNumber'`
        if [ "$block_number" -eq "$num" ]; then
            if [ $1 -eq 0 ]; then
                geth attach --exec 'miner.start()' > /dev/null
            fi
            sleep 1
            mining `expr $1 + 2`
        else
            geth attach --exec 'miner.stop()' > /dev/null
            geth attach --exec 'eth.blockNumber' > $block_file
        fi
    fi
}

time=`date +%s`
next=`expr $time - $block_time`
if [ $next -ge "$INTERVAL" ]; then
    mining 0
    echo $time > $time_file
fi

