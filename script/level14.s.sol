// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {GatekeeperTwo} from "../src/level14/GatekeeperTwo.sol";
import {AttackGatekeeperTwo} from "../src/level14/AttackGatekeeperTwo.sol";
import "forge-std/console.sol";

contract level14Exploit is Script {
    GatekeeperTwo gatekeeperTwo =
        GatekeeperTwo(0x380a9254393c2a4A00d322CE93a08B8662057886);

    function run() external {
        vm.startBroadcast();
        console.log("Entrant: ", gatekeeperTwo.entrant());
        new AttackGatekeeperTwo(address(gatekeeperTwo));
        console.log("Entrant: ", gatekeeperTwo.entrant());
        vm.stopBroadcast();
    }
}
