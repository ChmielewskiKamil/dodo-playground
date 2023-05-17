// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Test, stdStorage, StdStorage, console} from "forge-std/Test.sol";
import {Addresses} from "./Addresses.sol";

contract Boilerplate is Test, Addresses {
    using stdStorage for StdStorage;

    address public ATTACKER;
    address public USER1;
    address public USER2;
    address public USER3;
    address public USER4;
    address public DEPLOYER;

    bool public activePrank;

    function setUp() public {
        makeAddr();
        labelAddr();
        deal(address(dai), USER1, 10_000e18);
        // Add marginTradingFactory to approved proxies list
        writeMappingSlot({target: address(dodoApproveProxy), signature: "_IS_ALLOWED_PROXY_(address)", addr: address(marginTradingFactory), value: 1 });
    }

    ////////////////////////////////////////////////////////////////////
    //                           Utilities                            //
    ////////////////////////////////////////////////////////////////////

    function suStart(address user) public {
        vm.startPrank(user);
        activePrank = true;
    }

    function suStop() public {
        vm.stopPrank();
        activePrank = false;
    }

    modifier asUser(address user) {
        suStart(user);
        _;
        suStop();
    }

    function makeAddr() public {
        ATTACKER = address(0x1337);
        vm.label(ATTACKER, "ATTACKER");
        USER1 = address(0x1111);
        vm.label(USER1, "USER1");
        USER2 = address(0x2222);
        vm.label(USER2, "USER2");
        USER3 = address(0x3333);
        vm.label(USER3, "USER3");
        USER4 = address(0x4444);
        vm.label(USER4, "USER4");
    }

    function labelAddr() public {
        vm.label(address(this), "Test Contract");
        vm.label(address(weth), "weth");
        vm.label(address(dai), "dai");
        vm.label(address(usdc), "usdc");
        vm.label(address(dodoApprove), "dodoApprove");
        vm.label(address(dodoApproveProxy), "dodoApproveProxy");
        vm.label(address(mockRouter), "mockRouter");
        vm.label(address(lendingPool), "lendingPool");
        vm.label(address(marginTradingFactory), "marginTradingFactory");
        vm.label(address(marginTradingTemplate), "marginTradingTemplate");
        vm.label(address(localDeployer), "localDeployer");
    }

    function readSlot(address target, bytes4 selector) public returns (bytes32) {
        uint256 slot = stdstore.target(target).sig(selector).find();
        return vm.load(target, bytes32(slot));
    }

    function writeMappingSlot(address target, string memory signature, address addr, uint256 value) public {
        stdstore.target(target).sig(signature).with_key(addr).checked_write(value);
    }
}
