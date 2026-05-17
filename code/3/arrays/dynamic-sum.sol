// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Create a pure, external function that takes a dynamic size array of unsigned integers
    // Find the sum and return it as uint
    function sum(uint[] memory numbers) external pure returns (uint) {
        uint total = 0;
        
        // Loop through the dynamic array and sum all elements
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        
        return total;
    }
}