// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Create a public, dynamic sized array of unsigned integers as a state variable called evenNumbers
    uint[] public evenNumbers;
    
    // Create an external function called filterEven which takes a dynamic size array of unsigned integers
    function filterEven(uint[] memory numbers) external {
        // Clear the existing array (optional - depends on requirements)
        // If you want to replace existing evens each time, uncomment:
        // delete evenNumbers;
        
        // Loop through the input array
        for (uint i = 0; i < numbers.length; i++) {
            // Check if the number is even (divisible by 2)
            if (numbers[i] % 2 == 0) {
                // Push the even number into the storage array
                evenNumbers.push(numbers[i]);
            }
        }
    }
}