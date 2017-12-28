pragma solidity ^0.4.19;

contract GettersAndSettersContract {
    string value = "Hello World";

    /*
     * The 'constant' keyword is important for getters because without it,
     * you'll have to pay with gas to call the getter.
     * More specifically, you'll have to generate a new transaction on the
     * blockchain to call the getter even if you aren't changing the state of
     * the blockchain
     */
    function getValue() constant returns(string) {
        return value;
    }

    /*
     * Since setters change the state of your contract, and therefore the
     * state of the blockchain, they must be treated as a transaction. Hence,
     * you must not use the 'constant' keyword for setters.
     */
    function setValue(string newValue) {
        value = newValue;
    }
}