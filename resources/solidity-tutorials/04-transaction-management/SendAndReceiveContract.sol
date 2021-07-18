pragma solidity ^0.4.19;

contract SendAndReceiveContract {
    
    address issuer; // contract creator

    // Note: a constructor should NOT be payable
    function SendAndReceiveContract() {
        issuer = msg.sender;
    }

    /*
     * Events can be used to store logs or as triggers for a UI layer.
     * Events are much cheaper than contract variables
     * (8 gas/byte vs 625 gas/byte)
     */
    event LogTransfer(address indexed from, address indexed to, uint256 value);

    modifier ifIssuer {
        require(msg.sender == issuer);
        _; // '_' means "continue"
    }

    /*
     * Deposits Ether to the contract when called.
     */
    function sendFundsToContract() payable {
        // no function body;
        // the 'payable' keyword handles storing the money
    }

    /*
     * The issuer (creator) of the smart contract may call this function
     * to retrieve the funds stored in the smart contract.
     */
    function retrieveFundsFromContract(uint256 amount) ifIssuer {
        // transfer method handles errors
        // eg. retrieving more than is available.
        issuer.transfer(amount);
        LogTransfer(address(this), msg.sender, amount);
    }

    /*
     * This function returns the total balance of the smart contract.
     * Note: with the current setup, everybody can call this function.
     *       add the ifIssuer modifier to make it only viewable by the issuer.
     */
    function getContractBalance() constant returns(uint256) {
        // All contracts have a 'balance' variable by default
        return this.balance; // 'this' is a pointer to the contract
    }

}