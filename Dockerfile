FROM ubuntu:18.04

ARG path=/v1.14.0/dogecoin-1.14.0-x86_64-linux-gnu.tar.gz

RUN apt update && apt install -y wget && cd /tmp/

RUN wget -O dogecoin.tar.gz https://github.com/dogecoin/dogecoin/releases/download/${path} \
    && tar -xzvf dogecoin.tar.gz -C /opt/ && name=`ls /opt/ |grep 'dogecoin' |tail -n1` \
    && ln -s /opt/${name}/bin/dogecoin-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/dogecoind /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

# default 22555 22556, testnet: 44555 44556, regtest: 18332 18444
EXPOSE 22555 22556 44555 44556 18332 18444 
### VOLUME /home/${RUN_USER}/.dogecoin/

ENTRYPOINT ["/entrypoint.sh"]
CMD []
