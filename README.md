# Ether Testament

> Ethereum Smart Will - simple, trustless solution to transfer funds upon one's death

## About

The goal of this project was to create a simple trustless solution to solve a common cryptocurrency problem: loss of private keys.

**Basic Idea**:

After releasing the EtherTestament contract, the owner would be able to use it as his day-to-day wallet for transactions. If the owner doesn't interact with the wallet for a set period of time (defaults to two years), the funds become accessible to a set of whitelisted addresses.

**Goal**:

Provide a trustless way to ensure that your loved ones will eventually have access to your funds after your death without having to give them your private keys.

**Advantages**:

Unlike a regular ethereum wallet, the Ether contained in the wallet isn't lost if the owner loses the private keys. The Ether is only truly lost if the owner and all the whitelisted addresses lose their private keys.

The owner could also choose to whitelist a few of their own other addresses to ensure that they can (eventually) recover their Ether if they lose it.

## Contributing

**Easy way** (to test the code):

Copy/paste the contents of the .sol files on Remix, a Solidity online IDE: https://remix.ethereum.org/#version=soljson-v0.4.19+commit.c4cbbb05.js

_Make sure you are using compiler version 0.4.19_

You can run individual functions by clicking their names in the "Run" tab.
More information on Remix here: https://remix.readthedocs.io/en/latest/

**Hard way** (to actually use the contracts on the Ethereum blockchain):

Run a full Ethereum node and release the contract on the Ethereum blockchain.

## Contact

**Dominic Roy-Stang**

**Email**: dominicroystang@gmail.com

**ETH Address**: `0xad57b4e087bBF1E9e724B7555403f5d1dD3B8E7c`

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
