# docker-bitcoin-cash

Bitcoin cash by bitcoin-abc, office code : [github](https://github.com/Bitcoin-ABC/bitcoin-abc)

## build

```
sudo docker build -t microwww/bitcoin-cash:0.19.0 . \\
    --build-arg path=v0.19.0/bitcoin-abc-0.19.0-x86_64-linux-gnu.tar.gz
```

## demo

```
sudo docker run -p 8332:8332 -p 8333:8333 \
    -v /data/bitcoin-cash/:/root/.bitcoin/ microwww/bitcoin-cash:0.19.0
```

##

Block explorer [explorer](https://gastracker.io)
