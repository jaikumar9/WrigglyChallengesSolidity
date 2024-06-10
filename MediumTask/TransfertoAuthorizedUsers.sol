// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
  
    mapping(address => uint256) public balances;
    address[] authorizedUsers;
    mapping(address => bool) public isAuthorizedUser;
  
    constructor() {
        // Add the contract deployer to the list of authorized users
        authorizedUsers.push(msg.sender);
        isAuthorizedUser[msg.sender] = true;
    }

    modifier onlyAuthorized() {
        require(isAuthorizedUser[msg.sender], "Unauthorized access");
        _;
    }

   function transfer(address payable recipient, uint256 amount) public onlyAuthorized {
    require(balances[msg.sender] >= amount, "Insufficient balance");
    balances[msg.sender] -= amount;
    recipient.transfer(amount);
}

    function addAuthorizedUser(address user) public onlyAuthorized {
        // TODO
             authorizedUsers.push(user);
              isAuthorizedUser[user] = true;
    }

    function getAuthorizedUsers() public view returns (address[] memory) {
        // TODO
      return authorizedUsers;
    }
}
