FROM ubuntu:16.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt install wget -y
RUN ["apt-get", "install", "-y", "vim"]
RUN wget https://dist.ipfs.io/go-ipfs/v0.4.19/go-ipfs_v0.4.19_linux-amd64.tar.gz
RUN tar -zxvf go-ipfs_v0.4.19_linux-amd64.tar.gz
RUN cp go-ipfs/ipfs /bin/
RUN wget https://dist.ipfs.io/ipfs-cluster-ctl/v0.10.0/ipfs-cluster-ctl_v0.10.0_linux-amd64.tar.gz
RUN tar -zxvf ipfs-cluster-ctl_v0.10.0_linux-amd64.tar.gz
RUN cp ipfs-cluster-ctl/ipfs-cluster-ctl /bin/
RUN wget https://dist.ipfs.io/ipfs-cluster-service/v0.10.0/ipfs-cluster-service_v0.10.0_linux-amd64.tar.gz
RUN tar -zxvf ipfs-cluster-service_v0.10.0_linux-amd64.tar.gz
RUN cp ipfs-cluster-service/ipfs-cluster-service /bin/
RUN apt-get install net-tools

