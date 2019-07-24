FROM debian:stretch

ENV     ZCASH_VERSION=2.0.6 \
        ZCASH_CONF=/home/zcash/.zcash/zcash.conf

RUN apt update \
    && apt-get install -y apt-transport-https wget gnupg2 \
    && wget -qO - https://apt.z.cash/zcash.asc | apt-key add - \
    && echo "deb [arch=amd64] https://apt.z.cash/ jessie main" |tee /etc/apt/sources.list.d/zcash.list \
    && apt-get update \
    && apt-get install -y zcash=${ZCASH_VERSION}

RUN useradd -d /home/zcash -m zcash \
    && mkdir -p /home/zcash/.zcash/ \
    && cp /usr/share/doc/zcash/examples/zcash.conf ${ZCASH_CONF} \
    && chown -R zcash /home/zcash/ \
    && echo '/usr/bin/zcash-fetch-params && /usr/bin/zcashd' >> /start.sh

WORKDIR ["/home/zcash"]
VOLUME ["/home/zcash/.zcash"]
EXPOSE 8232/tcp

USER zcash

ENTRYPOINT ["/bin/bash", "/start.sh"]
