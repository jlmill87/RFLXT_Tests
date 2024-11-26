// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./BaseUpgradeable.sol";

contract CreatorNodeRewards is BaseUpgradeable {
    mapping(address => uint256) public rewards;

    event RewardDistributed(address indexed creator, uint256 amount);

    function distributeRewards(address[] calldata creators, uint256[] calldata amounts) external onlyAdmin {
        require(creators.length == amounts.length, "Array mismatch");

        for (uint256 i = 0; i < creators.length; i++) {
            rewards[creators[i]] += amounts[i];
            emit RewardDistributed(creators[i], amounts[i]);
        }
    }

    function claimRewards() external {
        uint256 reward = rewards[msg.sender];
        require(reward > 0, "No rewards");

        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(reward);
    }
}
