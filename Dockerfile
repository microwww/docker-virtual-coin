FROM ubuntu:cosmic 

ARG version=0.5.0
ENV omnicore_HOME=/opt/omnicore-${version}

RUN apt update && apt install -y wget \
    && mkdir -p /root/.bitcoin/ && cd /tmp/

RUN wget https://github.com/OmniLayer/omnicore/releases/download/v${version}/omnicore-${version}-x86_64-linux-gnu.tar.gz \
    && tar -xzvf omnicore-${version}-x86_64-linux-gnu.tar.gz -C /opt/ \
    && ln -s $omnicore_HOME/bin/omnicore-cli /usr/local/bin/ \
    && ln -s $omnicore_HOME/bin/omnicored /usr/local/bin/

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh && rm -rf /tmp/*

WORKDIR ${omnicore_HOME}

EXPOSE 8332 8333 18332 18333 18443 18444

ENTRYPOINT ["/entrypoint.sh"]
CMD []
