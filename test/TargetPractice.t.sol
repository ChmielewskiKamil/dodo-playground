// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Boilerplate} from "./Boilerplate.sol";
import {console2} from "forge-std/console2.sol";

contract TargetPractice is Boilerplate {
    address user1_marginTrading;

    function test_CreateMarginTrading() public {
        createMarginTrading();
    }

    function createMarginTrading() public asUser(USER1) {
        dai.approve(address(dodoApprove), 1000e18);

        // Deposit flag: 1 - ERC20, Token address: DAI, Deposit amount: 1000
        bytes memory depositParams = abi.encode(1, address(dai), 1000e18); 

        bytes memory executeParams = abi.encode();

        // Flag: 2 - Isolated Mode
        user1_marginTrading = marginTradingFactory.createMarginTrading({_flag: 2, depositParams: depositParams, executeParams: executeParams});
        vm.label(user1_marginTrading, "user1_marginTrading");
        console2.log(user1_marginTrading);
    }
}
