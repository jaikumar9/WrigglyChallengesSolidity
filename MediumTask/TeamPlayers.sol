// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Team {

    int[16] public teamPlayers;

    function initializeTeam() public {
        for (uint i = 0; i < teamPlayers.length; i++) {
            teamPlayers[i] = -1;
        }
    }

    function getTeamPlayers() public view returns (int[16] memory) {
      return teamPlayers;
    }

    function selectJerseyNumber(uint jerseyNumber) public view returns (int) {
      // selectJerseyNumber() - It will take only one argument of uint type and 
      // returns the players address from the array created above.
      // a) The argument passed into the function must be greater than equal to zero and less than equal to 15.
      //   [Hint - Use require]
     require(jerseyNumber >= 0, " Jersey number must me Greater then 0");
     require(jerseyNumber <= 15,"Jersey Num must be less them 15");
        return int(teamPlayers[jerseyNumber]);
    
    }

   function addPlayer(int playerAddress, uint jerseyNumber) public {
    // addPlayer: Allows a new player to be added to the team by specifying their Ethereum address
    // and the desired jersey number 
    // (which must be between 0 and 15 and must not already be assigned to another player).

    require(jerseyNumber >= 0 && jerseyNumber <= 15, "Jersey number must be between 0 and 15");
    require(teamPlayers[jerseyNumber] == -1, "Jersey number already assigned to another player");
    teamPlayers[jerseyNumber] = playerAddress;
}


    function removePlayer(uint jerseyNumber) public {
          require(jerseyNumber >= 0 && jerseyNumber <= 15, "Jersey number must be between 0 and 15");
          require(teamPlayers[jerseyNumber]!= -1, "Jersey number is not assigned to any player");
          teamPlayers[jerseyNumber] = -1;
        
    }

    function updatePlayerAddress(int newAddress, uint jerseyNumber) public {
          require(jerseyNumber >= 0 && jerseyNumber <= 15, "Jersey number must be between 0 and 15");
             teamPlayers[jerseyNumber] = newAddress;
    }
}
