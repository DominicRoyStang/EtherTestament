pragma solidity ^0.4.19;

contract KillableContract {
    
    address issuer;

    function KillableContract() public {
        issuer = msg.sender;
    }

    event LogTransfer(address indexed from, address indexed to, uint256 value);

    modifier ifIssuer {
        require(msg.sender == issuer);
        _; // continue
    }

    /*
     * Deposits Ether to the contract when called. Anybody can call.
     */
    function sendFundsToContract() payable {
        // the 'payable' keyword handles storing the money
    }

    /*
     * Returns the total balance of the smart contract.
     */
    function getContractBalance() constant returns(uint256) {
        return this.balance;
    }

    /*
     * Kill the contract, and return contract funds to the message sender.
     * Only the issuer is allowed to call this function.
     * Important: Permissions should be set for any function that can call the
     *            selfdestruct function because otherwise, anyone might be able
     *            to kill the contract.
     */
    function killContract() public ifIssuer {
        selfdestruct(msg.sender);
    }
}