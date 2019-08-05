#!/bin/sh

echo ${PASSWORD:=123456} >/root/eth.pass

gen='/root/.ethereum/genesis.json'
if [ ! -f "${gen}" ];then

    if [ ! "${#NONCE}" == 18 ] ; then
        address=`/usr/local/bin/geth account new --password /root/eth.pass 2>/dev/null |grep '0x'`
        NONCE=${address##* }
        NONCE=${NONCE:0:18}
    #    NONCE=`echo ${NONCE} | tr '[A-Z]' '[a-z]'`
    fi

    echo '{
      "config": {
          "chainId": 6,
          "homesteadBlock": 0,
          "eip155Block": 0,
          "eip158Block": 0
      },
      "alloc": {
          "0x0000000000000000000000000000000000000001": {"balance": "9876543210"},
          "0x0000000000000000000000000000000000000002": {"balance": "12345678901"}
      },
      "coinbase"   : "0x0000000000000000000000000000000000000000",
      "difficulty" : "0x20000",
      "extraData"  : "",
      "gasLimit"   : "0x2fefd8",
      "nonce"      : "'${NONCE}'",
      "mixhash"    : "0x0000000000000000000000000000000000000000000000000000000000000000",
      "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
      "timestamp"  : "0x00"
    }' > ${gen}

fi

if [ ! -d "/root/.ethereum/geth" ];then
    geth init ${gen}
fi

/usr/local/bin/geth $@
## /bin/sh
