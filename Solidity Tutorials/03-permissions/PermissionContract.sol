pragma solidity ^0.4.19;

contract PermissionContract {
    

    string value = "Hello World";
    address public issuer;

    // Constructor only runs once: when the contract is created.
    function PermissionContract() public {
        // msg is a reserved keyword in Solidity
        issuer = msg.sender;
    }

    /*
     * Ensure that functions that have the ifIssuer modifier are only executed
     * if the message sender is the issuer (owner) of the smart contract.
     * Otherwise, revert to the latest version on the blockchain and refund
     * remaining gas to the message sender.
     */
    modifier ifIssuer {
        require(msg.sender == issuer);
        
        _; // _; means "continue"
    }

    function getValue() public constant returns(string) {
        return value;
    }

    /*
     * Only the contract creator (issuer) can change the 'value' variable.
     */
    function setValue(string newValue) public ifIssuer {
        value = newValue;
    }


    // Without modifiers (bad practice):
    /*
    function setValue(string newValue) {
        if (issuer != msg.sender) {
            value = newValue;
        }
    }
    */
}
