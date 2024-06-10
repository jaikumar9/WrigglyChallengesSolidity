// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleModifiersThree {
    address public owner;
    uint256 public myNumber;

    constructor() {
        // TODO
      owner = msg.sender;
    }

    modifier onlyOwner() {
        // TODO
      require(msg.sender == owner,"Only Owner can call this function");
        _;
    }

    function setNumber(uint256 _number) external onlyOwner {
        // TODO
          myNumber = _number;
    }

    function getNumber() external view returns (uint256) {
        // TODO
      return myNumber;
    }
}
