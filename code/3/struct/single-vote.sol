// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    enum Choices { Yes, No }
    
    struct Vote {
        Choices choice;
        address voter;
    }
    
    // Create a public storage array of the Vote struct called votes
    Vote[] public votes;

    // Create an external, view function hasVoted which takes an address 
    // and returns a bool indicating if the address has cast a vote or not
    function hasVoted(address voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return true;
            }
        }
        return false;
    }

    function createVote(Choices choice) external {
        // Each address should only be allowed to call createVote once
        // If they try again, the call should be reverted
        require(!hasVoted(msg.sender), "Address has already voted");
        
        // Use the choice parameter and the msg.sender to create a new vote
        // and push it onto the array of votes
        votes.push(Vote(choice, msg.sender));
    }
    
    // Create an external function called changeVote which takes a Choices argument 
    // and changes the choice on the existing vote for the msg.sender
    function changeVote(Choices newChoice) external {
        // If they do not have an existing vote, revert the call
        require(hasVoted(msg.sender), "Voter has not cast a vote");
        
        // Find the voter's vote and update the choice
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = newChoice;
                break; // Exit the loop once found
            }
        }
    }
    
    // Create an external, view function findChoice which takes an address 
    // and returns a Choices value indicating the choice on the vote cast by the address
    function findChoice(address voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i].choice;
            }
        }
        // This line will never be reached if the voter has voted
        // But Solidity requires a return statement
        revert("Voter has not cast a vote");
    }
}