// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleHash {
    string public hashValue;

    function hash(string memory _message) public {
        // TODO
            hashValue = _message;
    }

    function getHashValue() public view returns (bytes32) {
        // TODO
     bytes32 result = keccak256(abi.encodePacked(hashValue));
      return result;
    }
}
