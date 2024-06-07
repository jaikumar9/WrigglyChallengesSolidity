// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringComparator {
    function compareStrings(
        string memory a,
        string memory b
    ) public pure returns (bool) {
        bytes32 hashA = keccak256(abi.encodePacked(a));
        bytes32 hashB = keccak256(abi.encodePacked(b));

        return hashA == hashB;
    }
}
