FROM ethereum/client-go

ENV PASSWORD=123456
ENV NONCE=

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [""]
## --mine --minerthreads=1 --maxpeers 0 --rpcaddr 0.0.0.0 --rpc --rpcapi db,eth,net,web3
