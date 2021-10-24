// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./interfaces/IGame.sol";

contract Infected is IGame {
    
    function description() external pure returns (string memory) {
        return "testing";
    }

}
