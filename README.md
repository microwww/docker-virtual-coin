# docker-litecoin

litecoin office code : [https://github.com/litecoin-project/litecoin](https://github.com/litecoin-project/litecoin)

### build
set version with '--build-arg' , download from `https://download.litecoin.org/litecoin-${version}/linux/litecoin-${version}-x86_64-linux-gnu.tar.gz` 

demo

```
sudo docker build -t microwww/litecoin:0.17.1 --build-arg version=0.17.1 .
```

### run 

docker images : https://hub.docker.com/r/microwww/litecoin

`docker run -v /data/litecoin/:/root/.litecoin/ microwww/litecoin:0.17.1`

port : main net: `9332` `9333`, testnet `19332` `19335`, regtest `19443` `19444` (version 0.17.1)
