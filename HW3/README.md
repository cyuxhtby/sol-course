### What are the advantages and disadvantages of the 256 bit word length in the EVM ###

**Advantages:**
Allows for very large integer operations, benefiting high precision arithmetic as it mitigates underflow/overflow errors within this length.
It can work with cryptographic operations directly given that the EVM uses Keccak-256.

**Disadvantages:**
Smaller data types like uint32 or uint8 still occupy a full 256-bit slot and this can lead to storage inefficiencies. In order to optimize the use of smaller data types you can pack them into a struct or use bit manipulation on a uint256 via bitwise operations and shifts.


### What would happen if the implementation of a precompiled contract varied between Ethereum clients? ###
If the implementation of a precompiled contract varied between network clients, it would result in inconsistent state and execution as nodes might disagree on block validity or tx outcomes. The Ethereum Foundation publishes specifications for standardization to prevent such issues. A L2 can also introduce additional precompiles to optimize specific use cases or functionalities unique to its environment.

### Write a simple contract that uses a memory variable, then using the Remix debugger step through the function and inspect the memory. ###
