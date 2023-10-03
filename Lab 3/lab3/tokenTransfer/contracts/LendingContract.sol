// SPDX-License-Identifier: MIT
// Tells the Solidity compiler to compile only from v0.8.13 to v0.9.0
pragma solidity ^0.8.13;

// This is just a simple example of a coin-like contract.
// It is not ERC20 compatible and cannot be expected to talk to other
// coin/token contracts.

contract LendingContract {
	mapping(address => uint256) public balances;
	uint256 public totalLiquidity;

	function deposit(uint256 amount) external {
		require(amount > 0, "Amount must be greater than 0");
		balances[msg.sender] += amount;
		totalLiquidity += amount;
	}

	function borrow(uint256 amount) external {
		require(amount > 0, "Amount must be greater than 0");
		require(balances[msg.sender] >= amount, "Insufficient balance");
		balances[msg.sender] -= amount;
	}
}
