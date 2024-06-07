// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WrigglyToken is ERC20 {
    using SafeMath for uint256;

    // TODO: Create mapping to keep track of the balance of each address
  mapping(address => uint256) fund;

    address public owner;

    constructor() ERC20("My Token", "MTKN") {
        // TODO
      owner = msg.sender;
    }

    function _mint(uint256 amount) public {
        // TODO
      fund[msg.sender] += amount;
      
    }

    function _burn(uint256 amount) public {
        // TODO
       fund[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint256){
        // TODO
      return fund[msg.sender];
    }
}