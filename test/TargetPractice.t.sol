// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Boilerplate} from "./Boilerplate.sol";

contract TargetPractice is Boilerplate {
    function test_something() public {
        makeAddr();
        deal(address(weth), USER1, 100e18);
        assertEq(weth.balanceOf(USER1), 1001e18);
    }
}

