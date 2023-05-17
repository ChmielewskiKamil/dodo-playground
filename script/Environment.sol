// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {IDODOApprove} from "dodo/marginTrading/interfaces/IDODOApprove.sol";
import {IDODOApproveProxy} from "dodo/mock/DODOApproveProxy.sol";
import {ILendingPool} from "dodo/aaveLib/Interfaces.sol";
import {IWETH} from "dodo/marginTrading/interfaces/IWETH.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

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
    IERC20 public immutable dai;
    IERC20 public immutable usdc;
    IWETH public immutable weth;

    constructor(DeploymentParameters memory params) {
        dodoApprove = IDODOApprove(params.dodoApprove);
        dodoApproveProxy = IDODOApproveProxy(params.dodoApproveProxy);
        lendingPoolV2 = ILendingPool(params.lendingPoolV2);
        dai = IERC20(params.dai);
        usdc = IERC20(params.usdc);
        weth = IWETH(params.weth);
    }
}
