pragma solidity ^0.4.19;

contract HelloWorldContract {
    string public word = "Hello World";
    /*
     * this is bad practice because anyone who has access to our
     * smart contract could get the world value.
     */
}