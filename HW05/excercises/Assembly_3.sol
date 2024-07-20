// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            let memptr := mload(0x40)
            let ltReturn := lt(x,y) // 1 if the left side is smaller, 0 otherwise.
            if iszero(ltReturn) {
                let result := sub(x, y)
                mstore(memptr, result)
                return(memptr, 0x20)
            }
            mstore(memptr, 0x0)
            return(memptr, 0x20)
        }
    }
}