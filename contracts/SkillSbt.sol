// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract SkillSbt {
    address private quizContract;
    uint256 private id;
    uint256 private MAX_INT =
        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    struct skillSbt {
        address owner;
        uint256 timestamp;
        uint256 id;
        uint256 quizId;
        uint256 scoringQuizId;
        address answerer;
    }
    skillSbt[] private skillSbts;

    constructor() {
        console.log("We have been constructed!");
        quizContract = 0x29684e9108A179c43e3Bc01DEad8076f8E5414e7; // goeli
        // quizContract = 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512; // local
        id = 0;
        skillSbts.push(
            skillSbt(
                0x019281ce34F8b8739991713D5E09D0C290B53886, // goeli
                // 0x70997970C51812dc3A010C7d01b50e0d17dc79C8, // local
                block.timestamp,
                id,
                0,
                MAX_INT,
                0x0000000000000000000000000000000000000000
            )
        );
        id++;
        skillSbts.push(
            skillSbt(
                0x159EeF981fDc77927a77A4e5769Ee7E6C03Fb6fC, // goeli
                // 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC, // local
                block.timestamp,
                id,
                0,
                MAX_INT,
                0x0000000000000000000000000000000000000000
            )
        );
        id++;
    }

    function mint(uint256 _quizId) public payable {
        skillSbts.push(
            skillSbt(
                msg.sender,
                block.timestamp,
                id,
                _quizId,
                MAX_INT,
                0x0000000000000000000000000000000000000000
            )
        );
        id++;
    }

    function getSkillSbts() public view returns (skillSbt[] memory) {
        return skillSbts;
    }

    function requestScoring(uint256 _quizId)
        public
        returns (skillSbt[] memory)
    {
        uint256 cntMarker = 0;
        for (uint256 i = 0; i < skillSbts.length; i++) {
            if (skillSbts[i].quizId != _quizId) {
                continue;
            }
            if (skillSbts[i].scoringQuizId != MAX_INT) {
                continue;
            }
            skillSbts[i].scoringQuizId = _quizId;
            skillSbts[i].answerer = msg.sender;
            cntMarker++;
            if (cntMarker >= 2) {
                return skillSbts;
            }
        }
        for (uint256 i = 0; i < skillSbts.length; i++) {
            if (skillSbts[i].scoringQuizId != MAX_INT) {
                continue;
            }
            skillSbts[i].scoringQuizId = _quizId;
            skillSbts[i].answerer = msg.sender;
            cntMarker++;
            if (cntMarker >= 2) {
                return skillSbts;
            }
        }
        // skillSbt[] memory dummy;
        return skillSbts;
    }
}
