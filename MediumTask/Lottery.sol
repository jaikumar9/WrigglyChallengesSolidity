// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Lottery {

    struct Ticket {
        uint id;
        address owner;
    }
    
    Ticket[100] public tickets;
    uint public ticketCount;
    address payable winner;

    constructor(uint _ticketCount) {
        // TODO: Initialize ticketCount
      ticketCount = _ticketCount;
    }
    
   function buyTicket(uint id) public payable {
        // Verify that the sent value is exactly 1 ether
        require(msg.value == 1 ether, "Please send exactly 1 ether.");

        // Create a new ticket
        Ticket memory newTicket = Ticket(id, msg.sender);

        // Add the new ticket to the tickets array
        tickets.push(newTicket);

        // Increment the ticketCount variable
        ticketCount++;

        // Transfer the ticket price (1 ether) to the contractinit
        payable(address(this)).transfer(1 ether);
    }
    
    function drawWinner() public {
        // TODO: Implement the drawWinner function. We have already defined a randomly generated winnerIndex.
        //       This owner of this ticket will be set as the winner of the lottery.
        // The function should also transfer the entire balance of the contract to the winner's address and reset the ticketCount variable to 0.
        uint winnerIndex = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, tickets.length))) % tickets.length;
    }

    function getWinner() public view returns (address) {
        // TODO: Require there has been a winner and return the winner
    }
}
