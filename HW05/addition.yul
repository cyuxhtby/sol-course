object "Addition" {
    code {
        let a := 0x07
        let b := 0x08

        let sum := add(a, b)

        // The free memory pointer is always located at address 0x40 in memory
        let ptr := mload(0x40)

        // Store sum at the free memory location
        mstore(ptr, sum)

        // Update the free memory pointer forward by 32 bytes (0x20)
        mstore(0x40, add(ptr, 0x20))

        // Return 32 bytes of data starting from `ptr`, where our sum is stored
        return(ptr, 0x20)
    }
}
