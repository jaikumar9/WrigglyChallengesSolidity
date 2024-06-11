// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeyPair {
    // Declare a private key variable here
    bytes32 private privateKey;
    bytes32 private publicKey;

    // Declare a function to generate a new key pair
    function generateKeyPair() public returns (bytes32, bytes32) {
        // TODO: Call a function to generate a new private key
           privateKey = generatePrivateKey();
        // TODO: Compute the corresponding public key
           publicKey = computePublicKey(privateKey);
        return (publicKey, privateKey);
    }

    // Implement a function to generate a new private key
    function generatePrivateKey() private view returns (bytes32) {
        // TODO: You can use Solidity's built-in cryptographic functions to generate a random private key
           return keccak256(abi.encodePacked(block.timestamp, block.prevrandao)) ;
    }

    // Implement a function to compute the corresponding public key
    function computePublicKey(bytes32 _privateKey) private pure returns (bytes32) {
        // TODO: You can use Solidity's built-in cryptographic functions to compute the public key from the private key
      return keccak256(abi.encodePacked(_privateKey));
    }
}