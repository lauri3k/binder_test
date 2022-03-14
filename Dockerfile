FROM ubuntu:focal
RUN apt update; apt install -y curl jq build-essential python3.8 python3-pip docker-compose jsonnet bison mercurial
RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN curl -OL https://golang.org/dl/go1.17.linux-arm64.tar.gz; mkdir /etc/golang; tar -xvzf go1.17.linux-arm64.tar.gz -C /etc/golang; ln -s /etc/golang/go/bin/go /usr/bin/go; rm -f go1.17.linux-arm64.tar.gz
RUN GO111MODULE="on" go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest; ln -s /root/go/bin/jb /usr/bin/jb
WORKDIR /workspace