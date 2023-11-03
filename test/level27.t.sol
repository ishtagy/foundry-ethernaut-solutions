// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {GoodSamaritan, Coin, Wallet} from "../src/level27/GoodSamaritan.sol";
import {AttackGoodSamaritan} from "../src/level27/AttackGoodSamaritan.sol";

contract level27 is Test {
    GoodSamaritan goodSamaritan =
        GoodSamaritan(0x615a4d8fB93b3d5BcbE8f4497141fF9986A9E0C8);

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testlevel27Exploit() public {
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
    }
}
