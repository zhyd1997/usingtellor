// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "../UsingTellor.sol";

/**
* @title UserContract
* This contract inherits UsingTellor for simulating user interaction
*/
contract BenchUsingTellor is UsingTellor{

    constructor(address payable _tellor) UsingTellor(_tellor) {}
}
