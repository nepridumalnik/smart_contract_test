// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Shop {
    address private owner_;
    mapping(address => uint256) private payments_;

    constructor() {
        owner_ = msg.sender;
    }

    function payForItem() public payable {
        payments_[msg.sender] = msg.value;
    }

    function widthDrawAll() public {
        address payable send_to = payable(owner_);
        address contract_address = address(this);
        send_to.transfer(contract_address.balance);
    }
}
