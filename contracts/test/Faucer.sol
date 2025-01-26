// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Faucet {
    address public owner_;

    constructor() {
        owner_ = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint256 withdraw_amount) public payable {
        require(
            withdraw_amount > 0,
            "Withdraw amount must be greater than zero"
        );
        require(
            address(this).balance >= withdraw_amount,
            "Insufficient contract balance"
        );

        payable(owner_).transfer(withdraw_amount);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
