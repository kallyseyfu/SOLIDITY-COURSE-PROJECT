// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
    }

    Proposal[] public proposals;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(
            Proposal({
                target: _target,
                data: _data,
                yesCount: 0,
                noCount: 0
            })
        );
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external {
        if (support) {
            proposals[proposalId].yesCount++;
        } else {
            proposals[proposalId].noCount++;
        }
        emit VoteCast(proposalId, msg.sender);
    }
}