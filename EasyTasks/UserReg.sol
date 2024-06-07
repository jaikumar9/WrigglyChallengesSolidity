// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract UserRegistration {
    
    // Define a struct to hold user information
    struct UserInfo {
        string name;
        string email;
    }
    
    // Define a mapping to store user information
    mapping(address => UserInfo[]) private userMapping;
    
    // Define an event to emit when a new user is registered
    event NewUserRegistered(address indexed userAddress, string name, string email);

    // Define the contract owner
    address public owner;
    
    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Define a modifier to restrict certain functions to the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }
    
    // Define a function to register user information
    function registerUser(string memory _name, string memory _email) public {
        // TODO: Store user information in the mapping
        // TODO: Emit event to notify that a new user is registered
        UserInfo memory newUser   = UserInfo(_name,_email);
        userMapping[msg.sender].push(newUser);
      emit NewUserRegistered(msg.sender,_name,_email);
      
    }
    
    // Define a function to retrieve user information
    function getUserInfo() public view returns(UserInfo[] memory) {
        // TODO: Retrieve user information from the mapping
        // TODO: Return user information
             return userMapping[msg.sender];
            

    }
    
    // Define a function to update user information
    function updateUserInfo(string memory _name, string memory _email) public {
        // TODO: Update user information in the mapping
         UserInfo memory newUser   = UserInfo(_name,_email);
          userMapping[msg.sender].push(newUser);
    }
    
    // Define a function to delete user information
    function deleteUser() public {
        // TODO: Delete user information from the mapping
        delete userMapping[msg.sender];
    }
}
