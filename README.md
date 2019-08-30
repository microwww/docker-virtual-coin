# docker-dogecoin
docker for dogecoin

### build
ARG : `--build-arg` for the github dogecoin *.tar.gz file

```
sudo docker build -t microwww/dogecoin:1.14.2 --build-arg path=/v1.14-beta-1/dogecoin-1.14.2-x86_64-linux-gnu.tar.gz .
```
