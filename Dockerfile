FROM ubuntu:bionic

WORKDIR /tracking_chain_app/

COPY . /tracking_chain_app

RUN apt-get -y -qq upgrade && \
    apt-get -qq update && \
    apt-get -y -qq install jq && \
    apt-get -y -qq install git && \
    apt-get -y -qq install curl && \
    apt-get -y -qq install gnupg && \
    apt-get -y -qq install build-essential && \
    apt-get -y -qq install net-tools && \
    apt-get -y -qq install telnet && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    sleep 2 && \
    cd ./tracking_chain_notruffle && npm install && cd .. && \
    npm install -g truffle && \
    apt-get -y -qq install software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get -qq update && apt-get install -y ethereum

EXPOSE 8545
EXPOSE 30303

ENV NAME World

ENTRYPOINT ["/bin/bash", "./tracking_chain_notruffle/initChain.sh", "./tracking_chain_notruffle/genesis_template.json", "docker"]