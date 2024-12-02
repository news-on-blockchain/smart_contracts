// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

abstract contract NewsToken is ERC20, Ownable {
    uint256 public redeemRate = 0.001 ether; // 1 NEWS = 0.001 ETH
    event TokensRedeemed(address indexed user, uint256 amount, uint256 ethAmount);

    constructor() ERC20("NewsToken", "NEWS") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function setRedeemRate(uint256 _redeemRate) public onlyOwner {
        redeemRate = _redeemRate;
    }

    function redeem(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        uint256 ethAmount = amount * redeemRate;
        require(address(this).balance >= ethAmount, "Insufficient ETH");
        
        _burn(msg.sender, amount);
        payable(msg.sender).transfer(ethAmount);
        emit TokensRedeemed(msg.sender, amount, ethAmount);
    }

    receive() external payable {}
}