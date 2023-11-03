// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {MagicNum} from "../src/level18/MagicNumber.sol";

contract level18Exploit is Script {
    MagicNum magicNum = MagicNum(0x4d329c717d277bbfBf003B2076c0B4bBeFB5D627);

    function run() external {
        vm.startBroadcast();

        bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";

        address addr;
        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))
        }
        require(addr != address(0));

        magicNum.setSolver(addr);

        vm.stopBroadcast();
    }
}
