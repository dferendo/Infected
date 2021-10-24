// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IGame {

    function description() 
        external 
        pure
        returns (string memory);
}
