pragma solidity ^0.4.19;

contract CallerContract {
    CalledContract toBeCalled = new CalledContract();
    // for an already deployed contract, use the following syntax:
    //CalledContract toBeCalled = CalledContract(0xAddressOfContract);
    //Note that you still need the source code of the called contract to be able to call it.

    function getNumber() constant returns(uint) {
        return toBeCalled.getNumber();
    }

    function getWords() constant returns(bytes32) {
        return toBeCalled.getWords();
    }
}

// Note: you can put this second contract in a separate file and import it.
// (assuming the other file is in the same directory) eg. import "CalledContract.sol";
contract CalledContract {
    uint number = 64;
    bytes32 words = "Hello World";
    //string words = "Hello World"; 
    // strings cannot be returned to other contracts. Use bytes32 instead. 
    // You can convert the bytes32 back to text using online tools.

    function getNumber() constant returns(uint) {
        return number;
    }

    function setNumber(uint _number) {
        number = _number;
    }

    function getWords() constant returns(bytes32) {
        return words;
    }
}