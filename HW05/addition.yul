// Prerequisites:
// All numbers in EVM assembly are in hexadecimal format (base-16).
// Some numbers are used as simple values, while others are used as memory offsets.
// The interpretation depends on the context of the opcode in which they are used.
// In this case, 0x07 and 0x08 are simple values (7 and 8) used in the context of `ADD`.
// 0x40 used with `MLOAD` is a memory offset, which could represent either a simple value or coincide with a conventional memory address.

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
