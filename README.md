# docker-ethereumclassic-coin
docker for ethereumclassic(ETC) coin, ethereum-classic code in [github](https://github.com/ethereumclassic/go-ethereum)

## build
arg : `--build-arg path` download file from github in ethereum-classic !

```
docker build -t microwww/ethereum-classic:5.5.3 . \
    --build-arg path=v5.5.3/ethereum-classic-go-ethereum-linux-v5.5.3.tar.gz
```

## run demo

```
docker run -d -p 8545:9545 -p 30303:30303 \
    -v /data/ethereum/:/root/.ethereum-classic/ microwww/ethereum-classic:6.0.6
```
File `/root/.ethereum-classic/OPTIONS` can set `docker run ...` arguments
