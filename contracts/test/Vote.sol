// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Vote {
    mapping(address => bool) private votes_;
    uint64 private votesCount_ = 0;

    function vote() public {
        bool voted = votes_[msg.sender];

        if (voted) {
            return;
        }

        votes_[msg.sender] = true;
        ++votesCount_;
    }

    function totalVotes() public view returns (uint64) {
        return votesCount_;
    }
}
