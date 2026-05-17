// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }
    
    // Create an external, view function called createVote which takes a Choices value as a parameter
    // and returns an instance of type Vote in memory
    function createVote(Choices choice) external view returns (Vote memory) {
        // Use the Choices value and the msg.sender as the values to create the vote
        return Vote(choice, msg.sender);
    }
}