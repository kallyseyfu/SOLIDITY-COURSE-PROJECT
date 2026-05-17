// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        // This function automatically runs when ether is sent to the contract
        // without any function call data
    }
    
    // Create a public payable function tip which sends any of its received ether to the owner
    function tip() external payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer failed");
    }
}