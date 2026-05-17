// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Create a public mapping called members which maps an address to a bool
    mapping(address => bool) public members;
    
    // Create an external function called addMember which takes an address and adds it as a member
    function addMember(address newMember) external {
        members[newMember] = true;
    }
    
    // Create an external, view function called isMember which takes an address
    // and returns a bool indicating whether or not the address is a member
    function isMember(address account) external view returns (bool) {
        return members[account];
    }
    
    // Create an external function called removeMember that will take an address
    // and set its corresponding value in the members mapping to false
    function removeMember(address existingMember) external {
        members[existingMember] = false;
    }
}