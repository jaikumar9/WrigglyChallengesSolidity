// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

abstract contract Solution {
    function func1() public pure  returns(uint) {
        return 100;
    }

    function func2() public virtual view returns(uint);
}

contract Implementation is Solution {
    function func2() public  override pure returns(uint) {
        return 100; // Provide a sample implementation
    }
}
