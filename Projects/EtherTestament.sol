pragma solidity ^0.4.19;

/*
 * EtherTestament Smart Contract.
 * Author: Dominic Roy-Stang (github.com/dominicroystang)
 *
 * This contract acts as a will to prevent the loss of Ether after one's death
 * This smart contract is account with a list whitelisted addresses that
 * may access its funds if the owner doesn't interact with it for longer than
 * a set period of time.
 *
 * Note: This contract uses block timestamps, which means that the time values
 *       are only precise to +-900 seconds.
 */
contract EtherTestament {
    
    address owner; // contract creator
    address[] whitelist;
    uint lastOwnerInteraction;
    uint waitTime;

    /*
     * Public constructor for the EtherTestament.
     * Lines followed by a "TODO" comment should be changed before deploying
     * the contract.
     */
    function EtherTestament() public {
        owner = msg.sender;
        lastOwnerInteraction = now;
        whitelist = new address[](2); //TODO: Change the number of whitelisted addresses
        whitelist[0] = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C; //TODO: Change or remove the whitelisted address
        whitelist[1] = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB; //TODO: Change or remove the whitelisted address
        waitTime = 2 years; //TODO: Change the wait time
    }

    /*
     * Transfers of funds are tracked with events.
     */
    event LogTransfer(address indexed from, address indexed to, uint256 value);

    /*
     * The owner of the contract is the address that deployed the contract
     * (the address that called the constructor).
     */
    modifier ifOwner {
        require(msg.sender == owner);
        lastOwnerInteraction = now;
        _; // continue
    }

    /*
     * An address is allowed if it is the owner OR
     * if the owner has not interacted the contract in a set amount of time
     * (the waitTime variable) and the message sender is whitelisted.
     */
    modifier ifAllowed {
        bool allowed = false;
        if (msg.sender == owner) {
            lastOwnerInteraction = now;
            allowed = true;
        } else {
            for (uint i = 0; i < whitelist.length; i++) {
                if (msg.sender == whitelist[i]) {
                    allowed = true;
                }
            }
        }
        if (!allowed) {
            // msg.sender is not in the whitelist and is not owner
            revert();
        }
        _;
    }

    /*
     * Deposits Ether to the contract when called.
     * Updates the lastOwnerInteraction if called by the contract owner.
     * Can be called with a payable of 0 ether to update the lastOwnerInteraction.
     */
    function addFunds() public payable {
        if (msg.sender == owner) {
            lastOwnerInteraction = now;
        }
        LogTransfer(msg.sender, address(this), msg.value);
    }

    /*
     * The owner of the smart contract may call this function
     * to retrieve the funds stored in the smart contract.
     */
    function retrieveFunds(uint256 amount) public ifAllowed {
        // transfer function handles errors
        // eg. retrieving more than is available.
        if (msg.sender == owner || now > lastOwnerInteraction + waitTime) {
            msg.sender.transfer(amount);
            LogTransfer(address(this), msg.sender, amount);
        }
    }

    /*
     * PUBLIC GETTERS
     * The functions below do not update the lastOwnerInteraction if called by
     * the contract owner.
     * This was done to minimize gas used when calling those functions.
     */

    /*
     * This function returns the total balance of the smart contract.
     */
    function getBalance() public constant returns(uint256) {
        // All contracts have a 'balance' variable by default
        return this.balance; // 'this' is a pointer to the contract
    }
    
    /*
     * returns the remaining time (in seconds) until the Ether stored in this contract
     * can be redeemed by a whitelisted address.
     */
    function getRemainingTime() public constant returns(int) {
        int remainingTime = int(lastOwnerInteraction + waitTime) - int(now);
        return remainingTime > 0 ? remainingTime : 0;
    }

}