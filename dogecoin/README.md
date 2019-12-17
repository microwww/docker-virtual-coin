# docker-dogecoin
docker for dogecoin

### build
ARG : `--build-arg` for the github dogecoin *.tar.gz file

```
sudo docker build -t microwww/dogecoin:1.14.2 \
    --build-arg path=/v1.14-beta-1/dogecoin-1.14.2-x86_64-linux-gnu.tar.gz .
```

### demo

```
sudo docker run -d -v /data/dogcoin/:/root/.dogecoin/ \
      -p 22555:22555 -p 22556:22556 \
      microwww/dogecoin:1.14.0 -server=1
```
