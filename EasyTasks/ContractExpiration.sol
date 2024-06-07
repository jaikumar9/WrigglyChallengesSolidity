// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint public creationTime;
    uint public expirationTime;

    constructor() {
        // TODO: Set creationTime to block timestamp
      creationTime = block.timestamp;
    }

    function onTime() public {
        // TODO: Set expirationTime to be after creationTime
              expirationTime  =  creationTime + 1 days;
      
    }

    function expire() public {
        // TODO: Set expirationTime to be before creationTime
      expirationTime = creationTime - 1 days;
    }

    function isExpired() public view returns (bool) {
        return block.timestamp >= expirationTime;
    }
}
