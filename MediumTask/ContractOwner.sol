// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Owner {
    address public owner;

    constructor() {
      owner = msg.sender;
    }

    function returnOwner() public view returns (address) {
      return owner;
    }
}
