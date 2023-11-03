// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {DoubleEntryPoint, Forta, CryptoVault, LegacyToken} from "../src/level26/DoubleEntryPoint.sol";
import {DetectionBot} from "../src/level26/DetectionBot.sol";

contract level26 is Test {
    DoubleEntryPoint doubleEntryPoint =
        DoubleEntryPoint(0x5Af2AD3637Ad1433F90CBa7F74AB9176B60c95cb);

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testlevel26Exploit() public {
        CryptoVault cryptoVault = CryptoVault(doubleEntryPoint.cryptoVault());
        Forta forta = doubleEntryPoint.forta();

        address user = 0xa659D686d7D696D496BeB0b781AB4734A4673294;
        vm.startPrank(user);
        DetectionBot detectionBot = new DetectionBot(
            forta,
            address(cryptoVault)
        );

        forta.setDetectionBot(address(detectionBot));

        vm.stopPrank();
    }
}
