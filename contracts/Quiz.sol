// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Quiz {
    uint256 private id;
    struct quiz {
        address quizner;
        uint256 timestamp;
        uint256 id;
        string title;
        string desc;
    }

    quiz[] private quizzes;

    constructor() {
        console.log("We have been constructed!");
        id = 0;
    }

    function uploadQuiz(string memory _title, string memory _desc) public {
        quizzes.push(quiz(msg.sender, block.timestamp, id, _title, _desc));
        id++;
    }

    function getQuizzes() public view returns (quiz[] memory) {
        return quizzes;
    }
}
