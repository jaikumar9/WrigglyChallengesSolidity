// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Solution {
    struct Item {
        string name;
        uint256 price;
    }

    Item[] public inventory;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function addItemToInventory(
        string memory _name,
        uint256 _price
    ) public onlyOwner {
        // TODO
      inventory.push(Item(_name,_price));
    }

    modifier onlyOwner() {
      require(owner == msg.sender, "Only Owner can-" );
        _;
    }

    function getInventory() public view returns (Item[] memory) {
        // TODO
      return inventory;
    }

    function clearInventory() private onlyOwner {
        // TODO
      delete inventory;
    }
}
