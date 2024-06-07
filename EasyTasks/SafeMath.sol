pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SafeMathExample {
    using SafeMath for uint256;

    uint256 public value;

    function add(uint256 x, uint256 y) public {
        value = x.add(y);
    }

    function sub(uint256 x, uint256 y) public {
        value = x.sub(y);
    }

    function mul(uint256 x, uint256 y) public {
        value = x.mul(y);
    }

    function div(uint256 x, uint256 y) public {
        value = x.div(y);
    }

    function get() public view returns (uint256) {
        return value;
    }
}
