// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringLength {
    function getLength(string memory str) public pure returns (uint) {
        // TODO
      bytes memory strng1 = bytes(str);

      uint lngth = strng1.length;
      return lngth;
      
    }
}
