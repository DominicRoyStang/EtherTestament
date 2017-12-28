# README #

_Ethereum smart contracts README_

>Ethereum Smart Will (EtherTestament) and Solidity Tutorials

### What is this repository for? ###

The goal of this project was to create a simple trustless solution to solve a common cryptocurrency problem: losing private keys.
For more information, read the "What is EtherTestament.sol" section.

This repository was created while I was taking notes as I was learning about Solidity.
Those notes are saved in the "Solidity Tutorials" folder.
They can be used as a learning resource for people who have programming experience, and are interested in getting started with Solidity.

### What is EtherTestament.sol ###

EtherTestament.sol is the main file in this repository.

**Basic Idea**:

After releasing the EtherTestament contract, the owner would be able to use it as his day-to-day wallet for transactions. If the owner doesn't interact with the wallet for a set period of time (defaults to two years), the funds become accessible to a set of whitelisted addresses.

**Goal**:

Provide a trustless way to ensure that your loved ones will eventually have access to your funds after your death without having to give them your private keys.

**Advantages**:

Unlike a regular ethereum wallet, the Ether contained in the wallet isn't lost if the owner loses the private keys. The Ether is only truly lost if the owner and all the whitelisted addresses lose their private keys.

The owner could also choose to whitelist a few of their own other addresses to ensure that they can (eventually) recover their Ether if they lose it.

### How do I get set up? ###

**Easy way** (to test the code): 

copy/paste the contents of the .sol files on Remix, a solidity online IDE: https://remix.ethereum.org/#version=soljson-v0.4.19+commit.c4cbbb05.js

_Make sure you are using compiler version 0.4.19_

You can run individual functions by clicking their names in the "Run" tab.
More information on Remix here: https://remix.readthedocs.io/en/latest/

**Hard way** (to actually use the contracts on the Ethereum blockchain):

Run a full Ethereum node and release the contract on the Ethereum blockchain.

### Who do I talk to? ###

**Dominic Roy-Stang**

**Email**: dominicroystang@gmail.com

**ETH Address**: ```0x3203ea7fa2cd892586d6c7cd17cd0071440abbfe```
