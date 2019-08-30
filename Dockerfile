FROM ubuntu:18.04

ARG path=v0.15.2/bitcoin-gold-0.15.2-x86_64-linux-gnu.tar.gz

RUN apt update && apt install -y wget && cd /tmp/

RUN wget -O coin.tar.gz https://github.com/BTCGPU/BTCGPU/releases/download/${path} \
    && tar -xzvf coin.tar.gz -C /opt/ && name=`ls /opt/ |grep 'bitcoin-gold' |tail -n1` \
    && ln -s /opt/${name}/bin/bgold-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/bgoldd /usr/local/bin/

RUN rm -rf /tmp/*

# default 8332 8338, testnet: 18332 18338, regtest: 18332 18444
EXPOSE 8332 8338 18332 18338 18444 
### VOLUME /root/.bitcoingold/

ENTRYPOINT ["/usr/local/bin/bgoldd"]
CMD []
