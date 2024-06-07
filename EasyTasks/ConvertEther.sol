// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract EtherConverter {
 
    function etherToWei(uint256 etherAmount) public pure returns (uint256) {
        return (etherAmount * 1e18);
    }
    
  
    function weiToEther(uint256 weiAmount) public pure returns (uint256) {
        return (weiAmount / 1e18);
    }
}
