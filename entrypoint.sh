#!/bin/sh
set -e

pass='/root/.ethereum/eth.pass'
gen='/root/.ethereum/genesis.json'

mkdir -p /root/.ethereum/
echo ${PASSWORD:=123456} > ${pass}

if [ ! -f "${gen}" ] ; then

	/usr/local/bin/geth account new --password ${pass} > /dev/null 2>&1

	address=`geth account list 2>/dev/null | sed -n '1p' | cut -d { -f2 |cut -d } -f1`
    if [ ! "${#NONCE}" == 18 ] ; then
        NONCE=${address##* }
        NONCE=${NONCE:0:15}
        #NONCE=`echo ${NONCE} | tr '[A-Z]' '[a-z]'`
    fi

    echo '{
      "config": {
          "chainId": '`echo "0x0"${address:0:6} | xargs printf %o`',
          "homesteadBlock": 0,
          "eip155Block": 0,
          "eip158Block": 0
      },
      "alloc": {
          "0x0000000000000000000000000000000000000001": {"balance": "1"}
      },
      "coinbase"   : "0x'${address}'",
      "difficulty" : "0x20000",
      "extraData"  : "",
      "gasLimit"   : "0x2fefd8",
      "nonce"      : "0x0'${NONCE}'",
      "mixhash"    : "0x0000000000000000000000000000000000000000000000000000000000000000",
      "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
      "timestamp"  : "0x00"
    }' > ${gen}

fi

#if [ ! -d "/root/.ethereum/geth" ];then
    geth init ${gen} 2>/dev/null
#fi

if [ -f "/root/.ethereum/OPTIONS" ];then
    OPTIONS=`cat /root/.ethereum/OPTIONS`
fi

/usr/local/bin/geth ${OPTIONS} $@
## /bin/sh

