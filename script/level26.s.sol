// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {DoubleEntryPoint, Forta, CryptoVault, LegacyToken} from "../src/level26/DoubleEntryPoint.sol";
import {DetectionBot} from "../src/level26/DetectionBot.sol";

import "forge-std/console.sol";

contract level26Exploit is Script {
    DoubleEntryPoint doubleEntryPoint =
        DoubleEntryPoint(0x5Af2AD3637Ad1433F90CBa7F74AB9176B60c95cb);
    CryptoVault cryptoVault = CryptoVault(doubleEntryPoint.cryptoVault());
    Forta forta = doubleEntryPoint.forta();

    function run() external {
        vm.startBroadcast();
        DetectionBot detectionBot = new DetectionBot(
            forta,
            address(cryptoVault)
        );

        forta.setDetectionBot(address(detectionBot));

        vm.stopBroadcast();
    }
}
