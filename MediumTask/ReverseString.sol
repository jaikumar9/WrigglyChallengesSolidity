// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringManipulation {
    
    string public message;
    
    function setMessage(string memory _newMessage) public {
        // Check if _newMessage is not an empty string
        require(bytes(_newMessage).length > 0, "Message cannot be empty");
        
        // Set message
        message = _newMessage;
    }
    
    function reverseMessage() public view returns (string memory) {
        // Get the length of the original message
        bytes memory originalMessage = bytes(message);
        uint256 length = originalMessage.length;

        // Create a new bytes array for the reversed message
        bytes memory reversedMessage = new bytes(length);
        
        // Reverse the characters in the message
        for (uint256 i = 0; i < length; i++) {
            reversedMessage[length - 1 - i] = originalMessage[i];
        }
        
        // Return the reversed string
        return string(reversedMessage);
    }
}
