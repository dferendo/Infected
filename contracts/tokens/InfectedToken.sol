// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract InfectedToken is ERC1155, Ownable {
    uint256 public constant HOLY = 0;
    uint256 public constant INFECTED = 1;

    constructor(address[] memory _holy, address[] memory _infected) ERC1155("INFECTED GAME") {
        _mint(address(this), HOLY, _holy.length, "");
        _mint(address(this), INFECTED, _infected.length, "");
    }

}
