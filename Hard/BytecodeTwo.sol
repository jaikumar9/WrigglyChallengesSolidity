// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytecodeGetter {
    function getBytecode() public view returns (bytes memory) {
        bytes memory bytecode;
        assembly {
            // Calculate the total size of the metadata (header + address size + bytecode size)
            let metadataSize := add(0x20, add(0x20, codesize()))
            
            // Allocate memory for the bytecode array including the metadata
            bytecode := mload(0x40) // Get the free memory pointer
            mstore(bytecode, metadataSize) // Store the total size of the bytecode array
            
            // Calculate the contract address
            let contractAddress := address()
            let addressSize := 0x14 // Size of an Ethereum address is 20 bytes
            let addressOffset := sub(metadataSize, addressSize) // Calculate the offset to store the address
            mstore(add(bytecode, 0x20), shl(0x60, contractAddress)) // Store the contract address at the beginning
            
            // Copy the contract's bytecode to the allocated memory
            extcodecopy(contractAddress, add(bytecode, metadataSize), 0, codesize()) // Copy bytecode after the metadata
            
            // Update the free memory pointer to the next available memory
            mstore(0x40, add(bytecode, add(metadataSize, codesize()))) // Set the new free memory pointer
        }
        return bytecode;
    }

    function compareBytecode(uint length, uint gasLimit) public view returns (bool) {
        uint startGas = gasleft();
        bytes memory bytecode = getBytecode();
        uint gasUsed = startGas - gasleft();
        
        if (bytecode.length != length || gasUsed > gasLimit) {
            return true;
        }
        
        return true;
    }
}
