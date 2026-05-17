// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum ConnectionTypes { 
        Unacquainted,
        Friend,
        Family
    }
    
    // Create a public mapping called connections which will map an address 
    // to a mapping of an address to a ConnectionTypes enum value
    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address other, ConnectionTypes connectionType) external {
        // Make the connection from msg.sender => other => connectionType
        connections[msg.sender][other] = connectionType;
    }
}