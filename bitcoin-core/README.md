# docker-dash
Docker images for bitcoin 

### build

```
sudo docker build -t microwww/bitcoin-core:0.19.0.1 \
    --build-arg path=0.19.0.1/bitcoin-0.19.0.1-x86_64-linux-gnu.tar.gz .
```

Bitcoin office code in [github](https://github.com/bitcoin/bitcoin)

### demo

```
docker run -d --restart always \
    -v /home/blockchain/bitcoin-regtest/:/root/.bitcoin/ \
    --name btc-regtest -p 8332:18443 -p 8333:18444 \
	microwww/bitcoin-core:0.17.1 -regtest
```
