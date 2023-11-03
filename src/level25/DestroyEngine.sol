// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

contract DestroyEngine {
    function destroy() external {
        selfdestruct(payable(address(0)));
    }
}
