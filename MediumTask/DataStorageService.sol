// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    mapping(address => string[]) public userData;

    function storeData(string memory data) public payable {
        // Require a minimum fee for storing data
        require(msg.value > 0, "Data storage fee must be greater than 0");

        // Store the data in the user's array
        userData[msg.sender].push(data);
    }

    function getData(uint256 index) public view returns (string memory) {
        // Check if the index is within bounds
        require(index < userData[msg.sender].length, "Index out of bounds");
        return userData[msg.sender][index];
    }

    function getDataCount() public view returns (uint256) {
        // Return the number of data entries stored for the sender's address
        return userData[msg.sender].length;
    }
}
