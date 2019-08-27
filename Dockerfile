FROM ubuntu:18.04 

ARG version=5.5.3
ENV ETC_HOME=/opt/ethereum-classic-${version}

RUN apt update && apt install -y wget \
    && mkdir -p /root/.ethereum-classic/ && mkdir -p ${ETC_HOME} && cd /tmp/

RUN wget https://github.com/ethereumclassic/go-ethereum/releases/download/v${version}/ethereum-classic-go-ethereum-linux-v${version}.tar.gz \
    && tar -xzvf ethereum-classic-go-ethereum-linux-v${version}.tar.gz -C ${ETC_HOME} \
    && ln -s $ETC_HOME/geth /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

WORKDIR ${ETC_HOME}

EXPOSE 30303 30301 8545

ENTRYPOINT ["/entrypoint.sh"]
CMD []
