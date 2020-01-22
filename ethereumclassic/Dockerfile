FROM ubuntu:18.04 

ARG path=v1.9.6-etclabscore/multi-geth-linux.zip

RUN apt update && apt install -y wget unzip && cd /tmp/

RUN wget -O coin.zip https://github.com/etclabscore/multi-geth/releases/download/${path} \
    && unzip -d /opt/ coin.zip \
    && if [ -f "/opt/geth" ]; then name="."; else name=`ls /opt/ |grep 'geth' |tail -n1`; fi \
    && ln -s /opt/${name}/geth /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

EXPOSE 8545 30303

ENTRYPOINT ["/entrypoint.sh", "--classic"]

CMD []