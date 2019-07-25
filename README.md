# docker-ethereum-coin
docker for ethereum (ETH) coin

Office support docker image [ethereum](https://hub.docker.com/r/ethereum/client-go)

## Docker quick start

```
docker run -d --name ethereum-node -v /data/ethereum:/root \
           -p 8545:8545 -p 30303:30303 \
           ethereum/client-go
```

## regtest
inner net test, and 10 senconds mine one .
```
docker run -d --name ethereum-node -v /data/ethereum:/root \
           -p 8545:8545 -p 30303:30303 \
           ethereum/client-go --mine --minerthreads 1 \
                --dev --dev.period=10 --rpcaddr 0.0.0.0 \
                --rpc --rpcapi "db,eth,net,web3,personal" \
                --datadir /root/eth-data
```
