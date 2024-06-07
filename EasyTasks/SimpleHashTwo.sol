// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Solution {
    function ripemdHash(string memory _message) public pure returns (bytes20) {
        // TODO
      bytes20 hashVal =  ripemd160(abi.encodePacked(_message));
      return hashVal;
    }
}
