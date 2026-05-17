// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Create a public address state variable called owner on the contract
    address public owner;
    
    // Create a constructor function which will store the msg.sender in owner
    constructor() {
        owner = msg.sender;
    }
}