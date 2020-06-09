# docker-ethereum
docker for ethereum (ETH) coin

FROM ethereum/client-go:v1.8.23

## opt
Change /root/.ethereum/OPTIONS file modify command line args !
default args : `/root/.ethereum/ --rpcaddr 0.0.0.0 --rpc --rpcapi db,eth,net,web3`

ETH Block-explorer [explorer](https://etherscan.io/) OR [tokenview](https://eth.tokenview.com/), Office code [github] https://github.com/ethereum/go-ethereum
