// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringStorage {
    string private storedString;

    function set(string memory value) public {
        // TODO
      storedString = value;
    }

    function get() public view returns (string memory) {
        // TODO
      return storedString;
    }
}
