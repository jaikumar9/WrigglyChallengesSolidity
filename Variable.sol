// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Pool {
    enum State { Initialized, Finalized, Deactivated }
    State public poolState;

    constructor() {
        poolState = State.Initialized;
    }

    /**
        @dev   Checks if the pool is in the valid state (Initialized).
        @return True if the pool is in the valid state, false otherwise.
    */
    function isValidState() public view returns (bool) {
        return poolState == State.Initialized;
    }
}
