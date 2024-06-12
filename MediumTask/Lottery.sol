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
       ticketCount = 0;   // 
    }
    
    function buyTicket(uint id) public payable {
      require(msg.value == 1 ether, "Ticket price is 1 ether.");
        require(id < tickets.length, "Ticket ID exceeds the maximum limit.");
        require(tickets[id].owner == address(0), "Ticket with the given ID is already sold.");

        Ticket memory newTicket = Ticket(id, msg.sender);
        tickets[id] = newTicket;
        ticketCount++;
    }
    
    function drawWinner() public {
           require(ticketCount > 0, "No tickets sold.");
        uint winnerIndex = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, tickets.length))) % tickets.length;
       winner = payable(tickets[winnerIndex].owner);
        winner.transfer(address(this).balance);
        ticketCount = 0;
    }

   function getWinner() public view returns (address) {
        require(winner != address(0),"Please implement drawWinner");
        return winner;
    }
}
