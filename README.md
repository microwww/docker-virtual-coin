# docker-ethereum-coin
docker for ethereum (ETH) coin

Office support docker image [ethereum](https://hub.docker.com/r/ethereum/client-go)

## Docker quick start

```
docker run -d --name ethereum-node -v /data/ethereum:/root \
           -p 8545:8545 -p 30303:30303 \
           ethereum/client-go
```

## Regtest
inner net test, and 10 senconds mine one .
```
docker run -d --name ethereum-node -v /data/ethereum:/root \
           -p 8545:8545 -p 30303:30303 --datadir=/root/.ethereum/ \
           ethereum/client-go --mine --minerthreads 1 \
                --dev --dev.period=10 --rpcaddr 0.0.0.0 \
                --rpc --rpcapi "db,eth,net,web3,personal"
```
develop chain is mining to 0x000000... and not to modify !

## Private network chain
The dockerfile version, create genesis block with command `geth init` . Using docker `HEALTHCHECK` instruction to run `mining.sh` each 10 seconds, in `mining.sh` file will run `miner.start()` . you can modify the frequency with `ENV INTERVAL 55`, 0-10 is 10S, 11-20 is 20S, and so on (this time is only in the ideal case, AND not sure the count each mining) to change the frequency to run `miner.start()`.

Change `FROM ethereum/client-go:v1.8.23` can to make other version .
