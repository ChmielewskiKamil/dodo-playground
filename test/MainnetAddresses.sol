// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {IDODOApprove} from "dodo/marginTrading/interfaces/IDODOApprove.sol";
import {IDODOApproveProxy} from "dodo/mock/DODOApproveProxy.sol";
import {ILendingPool} from "dodo/aaveLib/Interfaces.sol";
import {IWETH} from "dodo/marginTrading/interfaces/IWETH.sol";
import {Environment} from "script/Environment.sol";

abstract contract MainnetAddresses {

    Environment public env = Environment(0xEb63D671653489B91E653c52a018B63D5095223B);

    //********************** DODO Approve *************************/
    IDODOApprove public immutable dodoApprove = env.dodoApprove();
    IDODOApproveProxy public immutable dodoApproveProxy = env.dodoApproveProxy();

    //******************* AAVE Lending Pool V2 ********************/
    ILendingPool public immutable lendingPool = env.lendingPoolV2();

    //******************* DODO Router ********************/

    //******************* Main Assets in DODO *********************/
    address public immutable dai = env.dai();
    address public immutable usdc = env.usdc();
    IWETH public immutable weth = env.weth();

    //************** AAVE Interest Bearing Tokens *****************/
    address public immutable aDai = 0x028171bCA77440897B824Ca71D1c56caC55b68A3;
    address public immutable aUsdc = 0xBcca60bB61934080951369a648Fb03DF4F96263C;
    address public immutable aWeth = 0x030bA81f1c18d280636F32af80b9AAd02Cf0854e;

    //****************** AAVE Debt Bearing Tokens *****************/
    address public immutable stableDebtDai = 0x778A13D3eeb110A4f7bb6529F99c000119a08E92;
    address public immutable variableDebtDai = 0x6C3c78838c761c6Ac7bE9F59fe808ea2A6E4379d;
}
