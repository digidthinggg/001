// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./interfaces/ILayer.sol";

contract Wallet {
  address layerAddr;

  function setLayerAddress(address _layerAddr) public virtual {
    layerAddr = _layerAddr;
  }

  event HandleLayerStartedEV();

  function test() public virtual {
    require(address(layerAddr) != address(0), "layerAddr is not set");

    ILayer(layerAddr).executeLayer();
  }

  function handleLayerStarted() external {
    emit HandleLayerStartedEV();
  }

  function handleLayerSuccess() external {
  }

  function handleLayerFailure() external {
  }
}
