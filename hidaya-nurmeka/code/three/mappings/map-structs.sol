// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    // Create a public mapping called users that will map an address to a User struct
    mapping(address => User) public users;

    // Create an external function called createUser
    function createUser() external {
        // Ensure that the createUser function is called with an address that is 
        // not associated with an active user. Otherwise, revert the call.
        require(!users[msg.sender].isActive, "User already exists and is active");

        // Create a new user and associate it to the msg.sender address
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    // Create an external function called transfer which takes two parameters: 
    // an address for the recipient and a uint for the amount
    function transfer(address recipient, uint amount) external {
        // Ensure that both addresses used in the transfer function have active users
        require(users[msg.sender].isActive, "Sender does not have an active user");
        require(users[recipient].isActive, "Recipient does not have an active user");
        
        // Ensure that the msg.sender has enough in their balance to make the transfer
        require(users[msg.sender].balance >= amount, "Insufficient balance");
        
        // Transfer the amount from the balance of the msg.sender to the recipient
        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}