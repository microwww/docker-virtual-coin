FROM ethereum/client-go:v1.8.23

VOLUME /root/.ethereum/

ENV PASSWORD=123456
ENV NONCE=
ENV INTERVAL=55
##  Math.floor((INTERVAL - 1)/10) * 10 + 10

COPY entrypoint.sh /
COPY mining.sh /
RUN chmod +x /entrypoint.sh /mining.sh

HEALTHCHECK --interval=10s --retries=3 CMD /mining.sh

ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT [""]
CMD [""]
## --mine --minerthreads=1 --maxpeers 0 --rpcaddr 0.0.0.0 --rpc --rpcapi db,eth,net,web3
