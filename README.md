# Automated setup of Ethereum nodes using Docker 

## Abstract

Since both former experiments, tracking_chain and tracking_chain_no_truffle, worked well but not without a lot of manual setup, some work on automation had to be done. The main functionality of this project is the creation of a private Ethereum network by basically just one command. Additionally, an application (Smart Contract + DApp) from the former projects can be used as a proof that the network is working properly.

## Starting the Network

Inside the project's root folder, there is a Shellscript called `start_pool.sh`. As a first argument, you have to pass the number of nodes that should be started. If no value is given, only the bootnode will show up. The second argument is optional: You can use `rebuild` to force docker to build renewed images. From there, all setup should be done by the script. The debug message `init done!` indicates the containers are up and running.

## Usage

As a first test, the connection to a Docker container can be established. Start the miner via `geth` and perform a `truffle migrate --reset --network TestNet`. Having finished successfully, the compiled bytecode needs to be moved to another container. This is due to the address of the compiled smart contract, which is changed every time we call `truffle migrate`. Otherwise, the event pipeline would not see a lot of incoming events with a wrong address listening on. Therefore, for a commonly known state, we need to "announce" the compiled state to all concerned parties. If we execute both DApps one the same node, this is not necessary.

Apart from that, there are not many restrictions what can be done here. Use the Docker CLI to connect to and configure nodes. Write your own smart contracts and DApps!

