// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// === Out of scope dodo ===
import {IDODOApprove} from "dodo/marginTrading/interfaces/IDODOApprove.sol";
import {IDODOApproveProxy} from "dodo/mock/DODOApproveProxy.sol";
import {MockRouter} from "src/MockRouter.sol";
// === In scope DODO ===
import {MarginTrading} from "dodo/marginTrading/MarginTrading.sol";
import {MarginTradingFactory} from "dodo/marginTrading/MarginTradingFactory.sol";
// === AAVE ===
import {ILendingPool} from "dodo/aaveLib/Interfaces.sol";
// === WETH ===
import {IWETH} from "dodo/marginTrading/interfaces/IWETH.sol";
// === IERC20 ===
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
// === Mainnet Addresses ===
import {Environment} from "script/Environment.sol";

/// @title Addresses
/// @author @kamilchmielu
/// @notice This contract holds every address that is used within the DODO Margin Trading
abstract contract Addresses {
    //************************* Mainnet Contracts *************************/
    Environment public constant env = Environment(0xEb63D671653489B91E653c52a018B63D5095223B);

    // Dodo specific contracts
    IDODOApprove public immutable dodoApprove = env.dodoApprove();
    IDODOApproveProxy public immutable dodoApproveProxy = env.dodoApproveProxy();

    // AAVE Lending Pool V2
    ILendingPool public immutable lendingPool = env.lendingPoolV2();

    //Main Assets in DODO
    IERC20 public immutable dai = env.dai();
    IERC20 public immutable usdc = env.usdc();
    IWETH public immutable weth = env.weth();

    //AAVE Interest Bearing Tokens
    address public immutable aDai = 0x028171bCA77440897B824Ca71D1c56caC55b68A3;
    address public immutable aUsdc = 0xBcca60bB61934080951369a648Fb03DF4F96263C;
    address public immutable aWeth = 0x030bA81f1c18d280636F32af80b9AAd02Cf0854e;

    // AAVE Debt Bearing Tokens
    address public immutable stableDebtDai = 0x778A13D3eeb110A4f7bb6529F99c000119a08E92;
    address public immutable variableDebtDai = 0x6C3c78838c761c6Ac7bE9F59fe808ea2A6E4379d;

    //************************* Local Deployments *************************/

    /* 1st deployed MarginTrading contract used by factory to clone new ones */
    MarginTrading public immutable marginTradingTemplate =
        MarginTrading(payable(0x774f5C00707DaB6A1E41636AE4803aD620A0f53E));
    MarginTradingFactory public immutable marginTradingFactory =
        MarginTradingFactory(payable(0xcDd73a57d8d27124040D02E52E3748E1C0117e88));

    MockRouter public immutable mockRouter = MockRouter(0xcDd73a57d8d27124040D02E52E3748E1C0117e88);

    address public immutable localDeployer = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
}
