// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Script} from "forge-std/Script.sol";
import {MainnetAddresses} from "./MainnetAddresses.sol";
import {MarginTrading} from "dodo/marginTrading/MarginTrading.sol";
import {MarginTradingFactory} from "dodo/marginTrading/MarginTradingFactory.sol";

/// @notice The base contract is the deployment of all the fundamental contracts
/// of DODO Margin Trading protocol. It will be deployed to anvil mainnet fork.
contract Base is Script, MainnetAddresses {
    // ===== Actors =====
    uint256 deployerPk;
    address deployer;

    // ==== Contracts ====
    MarginTrading marginTrading;
    MarginTradingFactory marginTradingFactory;

    function setUp() public {
        deployerPk = vm.envUint("DODO_DEPLOYER_PK"); 
        deployer = vm.addr(deployerPk);
    }

    function run() public {
        vm.startBroadcast(deployerPk);
        marginTrading = new MarginTrading();
        marginTradingFactory =
        new MarginTradingFactory(address(lendingPool), address(weth), address(dodoApproveProxy), address(marginTrading));

        vm.stopBroadcast();
    }
}
