// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

import "./interfaces/IGame.sol";

contract Infected is ERC1155, Ownable, IGame {
    uint256 public constant HOLY = 0;
    uint256 public constant INFECTED = 1;

    uint256 public constant NUMBER_OF_FAILED_ATTACKS_ALLOWED = 5;

    mapping(address => uint8) failedKillCount;

    // You should allow some grace period where players can set up addresses etc.
    uint256 public gameBlockStartTime;
    uint256 public gameBlockEndTime;

    modifier gameIsLive {
        require(block.number >= gameBlockStartTime && block.number <= gameBlockEndTime);
        _;
    }

    constructor(uint256 _gameBlockStartTime, uint256 _gameBlockEndTime, 
                address[] memory _holy, address[] memory _infected) 
                ERC1155("INFECTED GAME") {
        gameBlockStartTime = _gameBlockStartTime;
        gameBlockEndTime = _gameBlockEndTime;

        _mint(msg.sender, HOLY, _holy.length, "");
        _mint(msg.sender, INFECTED, _infected.length, "");

        for (uint i = 0; i < _holy.length; i++) {
            safeTransferFrom(msg.sender, _holy[i], HOLY, 1, "");
        }

        for (uint i = 0; i < _infected.length; i++) {
            safeTransferFrom(msg.sender, _infected[i], INFECTED, 1, "");
        }
    }

    function description() external pure returns (string memory) {
        return "testing";
    }

    function infect(address victim) external gameIsLive returns (bool) {
        require(balanceOf(msg.sender, INFECTED) >= 1);

        if (balanceOf(victim, HOLY) >= 1) {
            _burn(victim, HOLY, 1);
            return true;
        } 

        failedKillCount[msg.sender]++;

        if (failedKillCount[msg.sender] >= NUMBER_OF_FAILED_ATTACKS_ALLOWED) {
            _burn(msg.sender, INFECTED, 1);
        }

        return false;
    }

}
