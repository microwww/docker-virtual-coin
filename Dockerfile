FROM ubuntu:18.04

ARG version=1.14.0
ENV RUN_USER=dogecoin

RUN apt update && apt install -y wget && cd /tmp/

RUN wget -O dogecoin.tar.gz https://github.com/dogecoin/dogecoin/releases/download/v${version}/dogecoin-${version}-x86_64-linux-gnu.tar.gz \
    && tar -xzvf dogecoin.tar.gz -C /opt/ && name=`ls /opt/ |grep 'dogecoin' |tail -n1` \
    && ln -s /opt/${name}/bin/dogecoin-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/dogecoind /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh \
    && useradd -m -d /home/${RUN_USER} -s /bin/bash ${RUN_USER} \
    && rm -rf /tmp/*

USER ${RUN_USER}
# default 22555 22556, testnet: 44555 44556, regtest: 18332 18444
EXPOSE 22555 22556 44555 44556 18332 18444 

ENTRYPOINT ["/entrypoint.sh"]
CMD []
