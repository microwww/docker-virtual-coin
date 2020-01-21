# docker-ethereumclassic-coin
docker for ethereumclassic(ETC) coin, ethereum-classic code in new project at [github-etclabscore](https://github.com/etclabscore/go-ethereum) 

docker used Multi-Geth [code](https://github.com/etclabscore/multi-geth/releases), and **It is no longer recommended to run Classic Geth in production**

###

## build
arg : `--build-arg path` download file from github in [multi-geth](https://github.com/etclabscore/multi-geth/releases) !

```
docker build -t microwww/ethereum-classic:1.9.6-multi-geth . \
    --build-arg path=v1.9.6-etclabscore/multi-geth-linux.zip
```

## run demo

```
docker run -d -p 8545:9545 -p 30303:30303 \
    -v /data/ethereum/:/root/.ethereum/ microwww/ethereum-classic:1.9.6-multi-geth
```
File `/root/.ethereum-classic/OPTIONS` can set `docker run ...` arguments

NOTE: classic-geth default block-chain data in **/root/.ethereum-classic/** , BUT multi-geth in **/root/.ethereum/**
