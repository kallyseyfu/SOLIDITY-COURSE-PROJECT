// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackClub {
    // Create a dynamic sized array of addresses called members
    address[] public members;
    
    // Create a constructor which will add the deployer address as the first member
    constructor() {
        members.push(msg.sender);
    }
    
    // Create an external function addMember which has a single parameter: an address for a new member
    // Ensure that addMember can only be called by an existing member
    function addMember(address newMember) external {
        // Require that the caller is an existing member
        require(isMember(msg.sender), "Only existing members can add new members");
        
        // Add this address to the members array
        members.push(newMember);
    }
    
    // Create a removeLastMember function which will remove the last member added to the club
    // Ensure that removeLastMember can only be called by an existing member
    function removeLastMember() external {
        // Require that the caller is an existing member
        require(isMember(msg.sender), "Only existing members can remove members");
        
        // Require that there's at least one member to remove
        require(members.length > 0, "No members to remove");
        
        // Remove the last member from the array
        members.pop();
    }
    
    // Create a public view function isMember that takes an address and returns a bool
    function isMember(address memberToCheck) public view returns (bool) {
        // Loop through all members to check if the address exists
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == memberToCheck) {
                return true;
            }
        }
        return false;
    }
}