FROM ubuntu:18.04

ARG path=v0.14.0.3/dashcore-0.14.0.3-x86_64-linux-gnu.tar.gz

RUN apt update && apt install -y wget && cd /tmp/

RUN wget -O coin.tar.gz https://github.com/dashpay/dash/releases/download/${path} \
    && tar -xzvf coin.tar.gz -C /opt/ && name=`ls /opt/ |grep 'dashcore' |tail -n1` \
    && ln -s /opt/${name}/bin/dash-cli /usr/local/bin/ \
    && ln -s /opt/${name}/bin/dashd /usr/local/bin/

RUN rm -rf /tmp/*

# default: 9998 9999, testnet: 19998 19999, regtest: 18332 19994
EXPOSE 9998 9999 19998 19999 18332 19994 
### VOLUME /root/.dashcore/

ENTRYPOINT ["/usr/local/bin/dashd"]
CMD []
