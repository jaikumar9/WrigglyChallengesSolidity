// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Concatenate {
    function concat(string memory str1, string memory str2) public pure returns (string memory) {
        bytes memory strBytes1 = bytes(str1);
        bytes memory strBytes2 = bytes(str2);
        bytes memory result = new bytes(strBytes1.length + strBytes2.length);
        
        uint index = 0;
        for (uint i = 0; i < strBytes1.length; i++) {
            result[index++] = strBytes1[i];
        }
        
        for (uint j = 0; j < strBytes2.length; j++) {
            result[index++] = strBytes2[j];
        }
        
        return string(result);
    }
}
