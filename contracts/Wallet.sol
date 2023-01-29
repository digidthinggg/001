// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./interfaces/ILayer.sol";

contract Wallet {
  address layerAddr;

  function setLayerAddress(address _layerAddr) public virtual {
    layerAddr = _layerAddr;
  }

  // layers sequence

  // simple all need to be success
  // [ layer, layer, layer ]

  // sequence
  // [
  // [ layer ] <- needs to be success first
  // [ layer ] <- needs to be success second
  // [ layer ] <- needs to be success third
  // ]

  // multi sequence
  // [
  // [ layer, layer ] <- all need to be success first
  // [ layer ] <- all need to be completed second
  // [ layer, layer, layer ] <- all need to be success third
  // ]

  // amounts

  // can have one setting

  // can have setting dependant on amount
  // 100 usd one layers requirements
  // > 100 usd diff layers requirements
  // > 1000 usd diff layers requirements

  // can have setting dependant on coin

  // can have setting dependant on coin and amounts

  // layerRequirements: array
  //
  // struct
  // amount: value
  // token: value
  // requirements: array array
  //
  // struct
  // amount: value
  // token: value
  // requirements: array
  //
  // struct
  // amount: struct min,max
  // token: array token,token,token
  // requirements: array

  struct amountForLayerRequirements {
    min: uint256,
    max: uint256
  }

  string[] tokensForLayerRequirements;

  Layer[] flowForLayerRequirements;

  struct layerRequirementsSomething {
    amount: amountForLayerRequirements,
    tokens: tokensForLayerRequirements,
    requirements: flowForLayerRequirements
  }

  // 
  // LayerRequirementsSomething,
  // LayerRequirementsSomething,
  // LayerRequirementsSomething,
  // LayerRequirementsSomething

  Requirement

  // array of arrays of Layer for requirements

  // Requirements for user to add a layer.
  AddLayerRequirements = ;

  // Requirements for user to update a layer.
  UpdateLayerRequirements = ;

  // Requirements for a user to remove a layer.
  RemoveLayerRequirements = ;

  // Requirements for a user to withdraw their tokens from product.
  ReversalRequirements = ;
  
  // Requirements for a user to make a transfer.
  TransferRequirements = ;
  // Requirement[] TransferRequirements

  // struct Requirement = {
  //   struct amount = {
  //     min: 0,
  //     max: 100
  //   }
  //   string[] tokens = [ ETH,USDC,SHIB ]
  //   Layer[][] layerFlow
  // }

  // struct something = {
  // min0,max100
  // }
  // string[] tokens =
  // [ ETH,USDC,SHIB ]
  // ...
  // [
  //   [ LAYER,LAYER,LAYER ]
  // ]

  // min0,max100
  // [ USDT,UNI ]
  // [
  //   [ LAYER ]
  //   [ LAYER,LAYER ]
  // ]

  // min90,max150
  // [ BNB ]
  // [
  //   [ LAYER,LAYER ]
  //   [ LAYER ]
  // ]

  event HandleLayerStartedEV();
  event HandleLayerSuccessEV();
  event HandleLayerFailureEV();

  function test() public virtual {
    require(address(layerAddr) != address(0), "layerAddr is not set");

    ILayer(layerAddr).executeLayer();
  }

  function handleLayerStarted() external {
    emit HandleLayerStartedEV();
  }

  function handleLayerSuccess() external {
    emit HandleLayerSuccessEV();
  }

  function handleLayerFailure() external {
    emit HandleLayerFailureEV();
  }
}
