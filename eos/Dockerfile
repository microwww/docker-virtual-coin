###
# By https://www.netkiller.cn/blockchain/eos/eos.launch.html
FROM ubuntu:18.04

ARG path=v2.0.0/eosio_2.0.0-1-ubuntu-18.04_amd64.deb

VOLUME /data/
# 
RUN apt update && apt install -y wget \
    && mkdir -p /root/.local/share/eosio/ && ln -s /data/ /root/.local/share/eosio/nodeos

RUN cd /tmp/ \
    && wget https://github.com/EOSIO/eos/releases/download/${path} -O eos.deb \
    && wget https://eosnodes.privex.io/static/genesis.json -O genesis.json \
    && apt install -y ./eos.deb

COPY . /

RUN chmod +x /entrypoint.sh \
    && wget 'https://eosnodes.privex.io/?config=1' -a /config.ini

EXPOSE 9876 8888 

ENTRYPOINT ["/entrypoint.sh"]

