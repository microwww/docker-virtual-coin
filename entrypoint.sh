#!/bin/sh
set -e
OPTIONS=""
CONFIG="$HOME/.local/share/eosio/nodeos/config/"
if [ ! -d "$CONFIG" ];then
    mkdir "$CONFIG"
    cp /config.ini "$CONFIG" 
    OPTIONS="$OPTIONS --genesis-json /tmp/genesis.json"
fi

exec /usr/bin/nodeos ${OPTIONS}
## /bin/sh
