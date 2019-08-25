# docker-zcash-coin
Debian for zcash (ZEC) coin , block-chain database in /home/zcash/.zcash ! And config demo in `/usr/share/doc/zcash/examples/zcash.conf`

### build

`sudo docker build -t microwww/zcash:2.0.7 --build-arg ZCASH_VERSION=2.0.7 .`,  version only 2.0.6, 2.0.7 . Derbian not find other version

### demo : 
```
docker run -d -v /data/:/home/zcash/.zcash microwww/zcash:tagname
```

zcash code : [zcash](https://github.com/zcash/zcash)
