FROM ethereum/client-go:v1.8.23

VOLUME /root/.ethereum/

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT [""]
#CMD [""]
## --mine --minerthreads=1 --maxpeers 0 --rpcaddr 0.0.0.0 --rpc --rpcapi db,eth,net,web3
