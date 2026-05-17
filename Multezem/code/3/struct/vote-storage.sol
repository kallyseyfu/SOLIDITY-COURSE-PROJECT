// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    enum Choices { Yes, No }

    // Create a new struct called Vote that contains two properties: 
    // a Choices choice and an address voter
    struct Vote {
        Choices choice;
        address voter;
    }

    // Create a public storage variable called vote which is of the Vote type
    Vote public vote;

    function createVote(Choices choice) external {
        // Create a new instance of Vote and store it in the storage variable vote
        // Use the choice passed in as an argument and the msg.sender for the voter
        vote = Vote(choice, msg.sender);
    }
}