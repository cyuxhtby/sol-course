// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between  assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        // and return the result from the second block

        uint256 result;

        assembly {
            result := add(x, y)
            let memptr := mload(0x40)
            mstore(memptr, result)
            // Not updating the memory pointer in order to make our next mload easier
        }

        assembly {
            let memptr := mload(0x40)
            return(memptr, 0x20)
        }
    }
}