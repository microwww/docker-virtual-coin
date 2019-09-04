FROM ubuntu:18.04 

ARG version=6.0.6
ENV ETC_HOME=/opt/

RUN apt update && apt install -y wget \
    && mkdir -p /root/.ethereum-classic/ && mkdir -p ${ETC_HOME} && cd /tmp/

RUN wget https://github.com/ethereumclassic/go-ethereum/releases/download/v${version}/geth-classic-v${version}-linux.tar.gz \
    && gzip -d geth-classic-v${version}-linux.tar.gz && tar -xvf geth-classic-v${version}-linux.tar -C ${ETC_HOME} \
    && ln -s $ETC_HOME/geth-classic-v${version}-linux/geth /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

WORKDIR ${ETC_HOME}

EXPOSE 8545 30303

ENTRYPOINT ["/entrypoint.sh"]
CMD []
