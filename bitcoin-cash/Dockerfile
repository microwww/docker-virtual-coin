FROM ubuntu:18.04 

ARG path=v0.20.1/bitcoin-abc-0.20.1-x86_64-linux-gnu.tar.gz

RUN apt update && apt install -y wget gzip && cd /tmp/

RUN wget -O coin.tar.gz https://github.com/Bitcoin-ABC/bitcoin-abc/releases/download/${path} \
    && gzip -d coin.tar.gz && tar -xvf coin.tar -C /opt/ && name=`ls /opt/ |grep 'bitcoin' |tail -n1` \
    && ln -s /opt/${name}/bin/bitcoin-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/bitcoind /usr/local/bin/

RUN rm -rf /tmp/*

EXPOSE 8332 8333 18332 18333 18443 18444

ENTRYPOINT ["/usr/local/bin/bitcoind"]
CMD []
