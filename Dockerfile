FROM ruimarinho/bitcoin-core:0.18

ENV INTERVAL=595
##  Math.floor((INTERVAL - 1)/10) * 10 + 10

COPY mining-health.sh /
COPY bitcoin.conf /root/.bitcoin/bitcoin.conf
RUN chmod +x /mining-health.sh

HEALTHCHECK --interval=10s --retries=3 CMD /mining-health.sh

ENTRYPOINT ["bitcoind", "-conf=/root/.bitcoin/bitcoin.conf"]

