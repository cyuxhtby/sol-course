// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10; 

    function increment(uint256 num) public {
        // Modify state of the count variable from within
        // the assembly segment
        assembly { 
            // `count` is stored at storage slot 0 (0x0),
            // a second variable would be storage slot 1 (0x1), etc.
            let oldCount := sload(0x0)
            let newCount := add(oldCount, num)
            sstore(0x0, newCount)
        }
    }
}