# docker-dash
Docker images for dash coin

### build

```
sudo docker build -t microwww/dashcore:0.14.0.1 \
    --build-arg path=v0.14.0.1/dashcore-0.14.0.1-x86_64-linux-gnu.tar.gz .
```

DASH office code in [github](https://github.com/dashpay/dash)

### demo

```
docker run -d -p 9998:9998 -p 9999:9999 -v /data/dashcoin/:/root/.dashcore/ microwww/dashcore:0.14.0.1
```
