// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// This contract has the same logic as addition.yul but allows for user defined input values.

contract Addition {

    function AddTwoNumbers(uint256, uint256) public pure returns (uint256) {
        assembly {
                // Calldata memory structure:
                // 0x00 to 0x03: Function selector (4 bytes)
                // 0x04 to 0x23: First argument a (32 bytes)
                // 0x24 to 0x43: Second argument b (32 bytes)
                let a := calldataload(0x04)
                let b := calldataload(0x24)

                let sum := add(a, b)

                // The free memory pointer is always located at address 0x40 in memory
                let memptr := mload(0x40)

                // Store sum at the free memory location
                mstore(memptr, sum)

                // Update the free memory pointer forward by 32 bytes (0x20)
                mstore(0x40, add(memptr, 0x20))

                // Return 32 bytes of data starting from `memptr`, where our sum is stored
                return(memptr, 0x20)
        }
    }
}