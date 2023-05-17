// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Boilerplate} from "./Boilerplate.sol";
import {console} from "forge-std/console.sol";

contract TargetPractice is Boilerplate {
    function setUp() public {
        makeAddr();
        labelAddr();
        deal(dai, USER1, 10_000e18);
        // Add marginTradingFactory to approved proxies list
        writeMappingSlot({target: address(dodoApproveProxy), signature: "_IS_ALLOWED_PROXY_(address)", addr: address(marginTradingFactory), value: 1 });
    }

    function test_CreateMarginTrading() public {
        createMarginTrading();
    }

    function createMarginTrading() public asUser(USER1) {
        // Deposit flag: ERC20, Token address: DAI, Deposit amount: 1000
        bytes memory depositParams = abi.encode(1, dai, 1000e18); 

        bytes memory executeParams = abi.encode();
        // Flag: Isolated Mode
        address user1_marginTrading = marginTradingFactory.createMarginTrading({_flag: 2, depositParams: depositParams, executeParams: executeParams});
        vm.label(user1_marginTrading, "user1_marginTrading");
    }
}
