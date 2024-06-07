// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {
    function callAddMod(
        uint256 a,
        uint256 b,
        uint256 c
    ) public pure returns (uint) {
        // TODO
      return addmod(a,b,c);
    }

    function callMulMod(
        uint256 a,
        uint256 b,
        uint256 c
    ) public pure returns (uint) {
        // TODO
      return mulmod(a,b,c);
    }
}
