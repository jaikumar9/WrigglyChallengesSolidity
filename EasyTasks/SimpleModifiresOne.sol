// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleHash {
    uint256 public value;

    function incrementValue() public {
      ++value;
        // TODO
    }

    function getValue() public view returns (uint256) {
        // TODO
      return value;
      
    }

    function addNums(uint256 a, uint256 b) public pure returns (uint256) {
        // TODO
      uint256 c = a+b;
      return c;
    }
}
