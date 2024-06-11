// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Solution {
    uint public total;
    uint public gasUsed;

    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint startGas = gasleft();
        uint sum = 0; // Temporary variable to store the sum
        
        for (uint i = 0; i < nums.length; ++i) {
            bool isEven = nums[i] % 2 == 0;
            bool isLessThan99 = nums[i] < 99;
            if (isEven && isLessThan99) {
                sum += nums[i]; // Add the element to the sum
            }
        }
        
        total = sum; // Update the state variable
        
        uint gU = startGas - gasleft();
        gasUsed = gU;
    }

    function gasOptimized(uint optimizedGas) public view returns (bool) {
        if (gasUsed < optimizedGas) {
            return true;
        } else {
            return false;
        }
    }
}
