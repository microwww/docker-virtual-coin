FROM ubuntu:18.04

# https://bitcoincore.org/bin/bitcoin-core-0.19.0.1/bitcoin-0.19.0.1-x86_64-linux-gnu.tar.gz
ARG path=0.19.0.1/bitcoin-0.19.0.1-x86_64-linux-gnu.tar.gz

RUN apt update && apt install -y wget && cd /tmp/

RUN wget -O coin.tar.gz https://bitcoincore.org/bin/bitcoin-core-${path} \
    && tar -xzvf coin.tar.gz -C /opt/ && name=`ls /opt/ |grep 'bitcoin' |tail -n1` \
    && ln -s /opt/${name}/bin/bitcoin-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/bitcoind /usr/local/bin/

RUN rm -rf /tmp/*

# default: 
EXPOSE 8332 8333 18332 18333 18443 18444

# VOLUME /root/.bitcoin/

ENTRYPOINT ["/usr/local/bin/bitcoind"]

CMD [""]
