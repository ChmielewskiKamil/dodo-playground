// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// Foundry stuff
import {Script, stdJson} from "forge-std/Script.sol";
// Mainnet state stuff
import {DeploymentParameters, Environment} from "./Environment.sol";
// Local deployments, mocks etc. 
import {MarginTrading} from "dodo/marginTrading/MarginTrading.sol";
import {MarginTradingFactory} from "dodo/marginTrading/MarginTradingFactory.sol";
import {MockRouter} from "src/MockRouter.sol";

contract Deploy is Script {
    using stdJson for string;

    Environment public env;
    MarginTrading public marginTrading;
    MarginTradingFactory public marginTradingFactory;
    MockRouter public router;

    function run(DeploymentParameters memory params) public returns (Environment) {
        vm.startBroadcast();
        // Environment is reponsible for pulling the mainnet state to anvil
        env = new Environment(params);
        vm.label(address(env), "Environment");

        marginTrading = new MarginTrading();
        marginTradingFactory =
        new MarginTradingFactory(params.lendingPoolV2, params.weth, params.dodoApproveProxy, address(marginTrading));

        vm.stopBroadcast();

        return env;
    }

    function run(string memory pathToJSON) public returns (Environment) {
        (DeploymentParameters memory params) = fetchParameters(pathToJSON);
        return run(params);
    }

    function fetchParameters(string memory pathToJSON) internal view returns (DeploymentParameters memory params) {
        string memory root = vm.projectRoot();
        string memory json = vm.readFile(string.concat(root, "/", pathToJSON));
        bytes memory rawParams = json.parseRaw(".*");

        (,, params) = abi.decode(rawParams, (address, address, DeploymentParameters));
    }
}

