FROM debian:stretch

ENV ZCASH_DIR=/root/.zcash/
ARG version=v2.1.1

RUN apt update && apt install -y wget \
    && mkdir -p ${ZCASH_DIR} && cd /tmp/

RUN wget https://z.cash/downloads/zcash-${version}-linux64-debian-stretch.tar.gz -O zcash.tar.gz \
    && tar -xzvf zcash.tar.gz -C /opt/ && name=`ls /opt/ |grep 'zcash' |tail -n1` \
    && ln -s /opt/${name}/bin/* /usr/local/bin/ \
    && wget https://github.com/zcash/zcash/raw/0f091f228cdb1793a10ea59f82b7c7f0b93edb7a/contrib/debian/examples/zcash.conf -O ${ZCASH_DIR}/zcash.conf \
    && rm -rf /tmp/*

RUN echo '#!/bin/sh' > /entrypint.sh \
    && echo 'set -e' >> /entrypint.sh \
    && echo '/usr/local/bin/zcash-fetch-params' >> /entrypint.sh \
    && echo 'exec /usr/local/bin/zcashd $@' >> /entrypint.sh \
    && chmod +x /entrypint.sh

VOLUME ${ZCASH_DIR}

EXPOSE 8232/tcp

ENTRYPOINT ["/entrypint.sh"]
CMD [""]
