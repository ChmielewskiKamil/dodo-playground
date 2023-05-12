// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {IDODOApprove} from "dodo/marginTrading/interfaces/IDODOApprove.sol";
import {IDODOApproveProxy} from "dodo/mock/DODOApproveProxy.sol";
import {ILendingPool} from "dodo/aaveLib/Interfaces.sol";
import {IWETH} from "dodo/marginTrading/interfaces/IWETH.sol";

contract MainnetAddresses {
    //********************** DODO Approve *************************/
    IDODOApprove constant dodoApprove = IDODOApprove(0xCB859eA579b28e02B87A1FDE08d087ab9dbE5149);
    IDODOApproveProxy constant dodoApproveProxy = IDODOApproveProxy(0x335aC99bb3E51BDbF22025f092Ebc1Cf2c5cC619);

    //******************* AAVE Lending Pool V2 ********************/
    ILendingPool constant lendingPool = ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9);

    //******************* DODO Router ********************/

    //******************* Main Assets in DODO *********************/
    address constant dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    IWETH constant weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

    //************** AAVE Interest Bearing Tokens *****************/
    address constant aDai = 0x028171bCA77440897B824Ca71D1c56caC55b68A3;
    address constant aUsdc = 0xBcca60bB61934080951369a648Fb03DF4F96263C;
    address constant aWeth = 0x030bA81f1c18d280636F32af80b9AAd02Cf0854e;

    //****************** AAVE Debt Bearing Tokens *****************/
    address constant stableDebtDai = 0x778A13D3eeb110A4f7bb6529F99c000119a08E92;
    address constant variableDebtDai = 0x6C3c78838c761c6Ac7bE9F59fe808ea2A6E4379d;
}
