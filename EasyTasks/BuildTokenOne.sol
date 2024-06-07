// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WrigglyToken is ERC20 {
    using SafeMath for uint256;

    address public owner;

    constructor(uint256 initialSupply) ERC20("My Token", "MTKN") {
        // TODO
      _mint(msg.sender,initialSupply);
    }

    function getBalance() public view returns (uint256) {
        // TODO
      return balanceOf(msg.sender);  
        
    }
}
