// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Create a public address state variable called owner on the contract
    address public owner;
    
    // Create a constructor function which will store the msg.sender in owner
    constructor() {
        owner = msg.sender;
    }
    
    // Add a function to the contract that will allow it to receive ether 
    // on a transaction without any calldata
    receive() external payable {
        // This function automatically runs when ether is sent to the contract
        // without any function call data
    }
}