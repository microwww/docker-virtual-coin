FROM ubuntu:18.04 

ARG path=v6.0.8/geth-classic-v6.0.8-linux.tar.gz

RUN apt update && apt install -y wget gzip && cd /tmp/

RUN wget -O coin.tar.gz https://github.com/ethereumclassic/go-ethereum/releases/download/${path} \
    && gzip -d coin.tar.gz && tar -xvf coin.tar -C /opt/ \
    && if [ -f "/opt/geth" ]; then name="."; else name=`ls /opt/ |grep 'geth' |tail -n1`; fi \
    && ln -s /opt/${name}/geth /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

EXPOSE 8545 30303

ENTRYPOINT ["/entrypoint.sh"]
CMD []
