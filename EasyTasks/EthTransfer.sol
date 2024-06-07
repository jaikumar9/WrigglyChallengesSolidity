// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
  
contract Solution {
    // Event to log the payment
    event pay(address indexed account, uint256 amount);

    // Function to transfer ether
    function transfer(address payable _to, uint256 _amount) public {
        // Ensure the contract has enough balance to transfer
        require(_amount <= address(this).balance, "Insufficient balance");

        // Transfer the amount and check for success
        (bool success,) = _to.call{value: _amount}("");
        require(success, "Transfer failed.");

        // Emit the payment event
        emit pay(_to, _amount);
    }

    // Function to get the balance of a given address
    function getBalance(address _address) public view returns (uint256) {
        return _address.balance;
    }
}