# Optimizing Storage

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {
    struct payments {
        bool valid;
        uint256 amount;
        address sender;
        uint8 paymentType;
        uint256 finalAmount;
        address receiver;
        uint256 initialAmount;
        bool checked;
    }
    uint8 index;
    uint256 public number;
    bool flag1;
    address admin;
    mapping (address=>uint256) balances;
    bool flag2;
    address admin2;
    bool flag3;
    payments[8] topPayments;
    
    constructor(){
    }
    
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }
    
    function increment() public {
        number++;
    }
}
```

### Take this contract and use [this tool](https://github.com/naddison36/sol2uml) to know how many storage slots it is using. By reordering the variables, can you reduce the number of storage slots needed?
