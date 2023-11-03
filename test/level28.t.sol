// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {GatekeeperThree, SimpleTrick} from "../src/level28/GatekeeperThree.sol";
import {AttackGatekeeperThree} from "../src/level28/AttackGatekeeperThree.sol";

contract level28 is Test {
    GatekeeperThree gatekeeperThree =
        GatekeeperThree(payable(0x6B447F38680463C4F0DFA2851B0afA3CA0c53ff2));

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testlevel28Exploit() public {
        AttackGatekeeperThree attackGatekeeperThree = new AttackGatekeeperThree(
            address(gatekeeperThree)
        );
        console.log("Entrant: ", gatekeeperThree.entrant());
        attackGatekeeperThree.attack{value: 0.0011 ether}();
        console.log("Entrant: ", gatekeeperThree.entrant());
    }
}
