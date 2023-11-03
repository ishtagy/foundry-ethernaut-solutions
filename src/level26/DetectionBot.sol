// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IForta} from "./DoubleEntryPoint.sol";

import "forge-std/console.sol";

contract DetectionBot {
    IForta forta;
    address private cryptoVault;

    constructor(IForta _forta, address _cryptoVault) {
        forta = _forta;
        cryptoVault = _cryptoVault;
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        console.log("from contract");
        (, , address origSender) = abi.decode(
            msgData[4:],
            (address, uint, address)
        );

        if (origSender == cryptoVault) {
            forta.raiseAlert(user);
        }
    }
}
