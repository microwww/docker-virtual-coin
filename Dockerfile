FROM ubuntu:18.04

ARG version=1.14.0
ENV dogecoin_HOME=/opt/dogecoin-${version}

RUN apt update && apt install -y wget \
    && mkdir -p /root/.bitcoin/ && cd /tmp/

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v${version}/dogecoin-${version}-x86_64-linux-gnu.tar.gz \
    && tar -xzvf dogecoin-${version}-x86_64-linux-gnu.tar.gz -C /opt/ \
    && ln -s $dogecoin_HOME/bin/dogecoin-cli /usr/local/bin/ \
    && ln -s $dogecoin_HOME/bin/dogecoind /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

WORKDIR ${dogecoin_HOME}

EXPOSE 8332 8333 18332 18333

ENTRYPOINT ["/entrypoint.sh"]
CMD []


