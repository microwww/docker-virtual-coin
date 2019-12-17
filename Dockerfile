FROM ubuntu:18.04

ARG version=0.16.3

RUN apt update && apt install -y wget net-tools \
    && cd /tmp/

RUN wget -O coin.tar.gz https://download.litecoin.org/litecoin-${version}/linux/litecoin-${version}-x86_64-linux-gnu.tar.gz \
    && tar -xzvf coin.tar.gz -C /opt/ && name=`ls /opt/ |grep 'litecoin' |tail -n1` \
    && ln -s /opt/${name}/bin/litecoin-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/litecoind /usr/local/bin/

RUN rm -rf /tmp/*

## VOLUME /root/.litecoin
## default 9332 9333, testnet 19332 19335, regtest 19443 19444
EXPOSE 9332 9333 19332 19335 19443 19444

ENTRYPOINT ["/usr/local/bin/litecoind"]
CMD []
