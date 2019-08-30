FROM ubuntu:18.04

ARG version=1.14.0
ENV RUN_USER=dogecoin
ENV dogecoin_HOME=/opt/dogecoin-${version}

RUN apt update && apt install -y wget && cd /tmp/

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v${version}/dogecoin-${version}-x86_64-linux-gnu.tar.gz \
    && tar -xzvf dogecoin-${version}-x86_64-linux-gnu.tar.gz -C /opt/ \
    && ln -s $dogecoin_HOME/bin/dogecoin-cli /usr/local/bin/ \
    && ln -s $dogecoin_HOME/bin/dogecoind /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh \
    && useradd -m -d /home/${RUN_USER} -s /bin/bash ${RUN_USER} \
    && rm -rf /tmp/*

USER ${RUN_USER}
EXPOSE 8332 8333 18332 18333

ENTRYPOINT ["/entrypoint.sh"]
CMD []
