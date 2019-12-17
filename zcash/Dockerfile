FROM debian:stretch

ARG ZCASH_VERSION=2.0.6
ENV ZCASH_DIR=/root/.zcash/

RUN apt update \
    && apt-get install -y apt-transport-https wget gnupg2 \
    && wget -qO - https://apt.z.cash/zcash.asc | apt-key add - \
    && echo "deb [arch=amd64] https://apt.z.cash/ jessie main" |tee /etc/apt/sources.list.d/zcash.list \
    && apt-get update \
    && apt-get install -y zcash=${ZCASH_VERSION}

RUN mkdir -p ${ZCASH_DIR} \
    && cp /usr/share/doc/zcash/examples/zcash.conf ${ZCASH_DIR} \
    && echo '#!/bin/sh' > /start.sh \
    && echo 'set -e' >> /start.sh \
    && echo '/usr/bin/zcash-fetch-params' >> /start.sh \
    && echo 'exec /usr/bin/zcashd $@' >> /start.sh \
    && chmod +x /start.sh

VOLUME /root/.zcash
EXPOSE 8232/tcp

ENTRYPOINT ["/start.sh"]
CMD [""]
