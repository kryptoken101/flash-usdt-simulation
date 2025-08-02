// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FakeUSDT is ERC20 {
    address public owner;

    constructor() ERC20("FakeUSDT", "USDT") {
        owner = msg.sender;
        _mint(owner, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == owner, "Only owner can mint");
        _mint(to, amount);
    }
}