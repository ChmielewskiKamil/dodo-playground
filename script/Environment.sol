// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {IDODOApprove} from "dodo/marginTrading/interfaces/IDODOApprove.sol";
import {IDODOApproveProxy} from "dodo/mock/DODOApproveProxy.sol";
import {ILendingPool} from "dodo/aaveLib/Interfaces.sol";
import {IWETH} from "dodo/marginTrading/interfaces/IWETH.sol";

struct DeploymentParameters {
    address dodoApprove;
    address dodoApproveProxy;
    address lendingPoolV2;
    address dai;
    address usdc;
    address weth;
}

contract Environment {
    IDODOApprove public immutable dodoApprove;
    IDODOApproveProxy public immutable dodoApproveProxy;
    ILendingPool public immutable lendingPoolV2;
    address public immutable dai;
    address public immutable usdc;
    IWETH public immutable weth;

    constructor (DeploymentParameters memory params) {
        dodoApprove = IDODOApprove(params.dodoApprove);
        dodoApproveProxy = IDODOApproveProxy(params.dodoApproveProxy);
        lendingPoolV2 = ILendingPool(params.lendingPoolV2);
        dai = params.dai;
        usdc = params.usdc;
        weth = IWETH(params.weth);
    }
}
