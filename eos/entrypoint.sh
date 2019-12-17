#!/bin/bash
set -e
OPTIONS=""
DIR="$HOME/.local/share/eosio/nodeos/"

if [[ "$@" =~ "--data-dir" ]];then
    echo 'Not set --data-dir arguments, with docker run -v /x/y/z/:/data/'
    exit 1
fi

if [ ! -d "${DIR}/data" ];then
    mkdir -p "${DIR}/config/"
    if [ ! -f "${DIR}/config/config.ini" ];then
        cp /config.ini "${DIR}/config/"
    fi
    OPTIONS="$OPTIONS --genesis-json /tmp/genesis.json"
fi

exec /usr/bin/nodeos ${OPTIONS} $@
## /bin/sh
