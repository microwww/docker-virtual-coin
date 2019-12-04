###
# By https://www.netkiller.cn/blockchain/eos/eos.launch.html
FROM ubuntu:18.04

VOLUME /data/
# 
RUN apt update && apt install -y wget curl \
    && mkdir -p /root/.local/share/eosio/ && ln -s /data/ /root/.local/share/eosio/nodeos

RUN cd /tmp/ \
    && wget https://github.com/eosio/eos/releases/download/v1.8.6/eosio_1.8.6-1-ubuntu-18.04_amd64.deb -O eos.deb \
    && wget https://eosnodes.privex.io/static/genesis.json -O genesis.json \
    && apt install -y ./eos.deb

COPY . /

RUN chmod +x /entrypoint.sh \
    && curl 'https://eosnodes.privex.io/?config=1' >> /config.ini

ENTRYPOINT ["/entrypoint.sh"]

