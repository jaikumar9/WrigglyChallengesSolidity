// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SupplyChain {
    
    address public owner;
    
    struct Product {
        string name;
        address owner;
    }
    
    mapping(uint => Product) public products;
    uint public productCount;
    
    constructor() {
        // Set the contract creator as the owner
        owner = msg.sender;
    }
    
    function registerProduct(string memory name) public {
        // Create a new Product with a unique ID and initialize the owner to the caller
        uint256 newId = productCount + 1;
        products[newId] = Product(name, msg.sender);
        productCount++;
    }
    
    function transferProduct(uint id, address newOwner) public {
        // Transfer ownership of the product with the corresponding ID to the new owner
        // Revert the transaction if the caller is not the current owner of the product
        require(msg.sender == products[id].owner, "Only the current owner can transfer the product");
        products[id].owner = newOwner;
    }
    
    function getProductOwner(uint id) public view returns (address) {
        // Return the address of the current owner of the product with the corresponding ID
        return products[id].owner;
    }
    
}
