// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract SkillSbt {
    address private quizContract;
    uint256 private id;
    struct skillSbt {
        address owner;
        uint256 timestamp;
        uint256 id;
        uint256 quizId;
    }
    skillSbt[] private skillSbts;

    constructor() {
        console.log("We have been constructed!");
        quizContract = 0x29684e9108A179c43e3Bc01DEad8076f8E5414e7;
        id = 0;
        skillSbts.push(skillSbt(msg.sender, block.timestamp, id, 0));
        id++;
        skillSbts.push(
            skillSbt(
                0x019281ce34F8b8739991713D5E09D0C290B53886,
                block.timestamp,
                id,
                0
            )
        );
        id++;
    }

    function mint(uint256 _quizId) public {
        skillSbts.push(skillSbt(msg.sender, block.timestamp, id, _quizId));
        id++;
    }

    function getSkillSbts() public view returns (skillSbt[] memory) {
        return skillSbts;
    }
}
