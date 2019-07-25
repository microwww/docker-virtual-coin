# docker-ethereum-coin
docker for ethereum (ETH) coin

Office support docker image [ethereum](https://hub.docker.com/r/ethereum/client-go)

## Docker quick start

````
docker run -d --name ethereum-node -v /Users/alice/ethereum:/root \
           -p 8545:8545 -p 30303:30303 \
           ethereum/client-go
```
