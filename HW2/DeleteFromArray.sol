// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeleteFromArray {

    uint256[] arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    function deleteItem(uint256 index) public {
        for (uint256 i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function deleteRandom() public {
        uint256 rand = uint256(keccak256(abi.encodePacked(
            tx.origin,
            blockhash(block.number - 1),
            block.timestamp
        )));
        for (uint256 i = rand % arr.length; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function getArray () public view returns (uint256[] memory) {
        return arr;
    }

}
