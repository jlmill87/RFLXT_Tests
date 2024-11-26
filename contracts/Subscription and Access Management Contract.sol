// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./BaseUpgradeable.sol";

contract SubscriptionManager is BaseUpgradeable {
    mapping(address => uint256) public subscriptions;

    event Subscribed(address indexed user, uint256 duration);
    event SubscriptionRenewed(address indexed user, uint256 duration);

    function subscribe(uint256 duration) external payable {
        require(msg.value > 0, "Payment required");

        subscriptions[msg.sender] += duration;
        emit Subscribed(msg.sender, duration);
    }

    function renewSubscription(uint256 duration) external payable {
        require(msg.value > 0, "Payment required");

        subscriptions[msg.sender] += duration;
        emit SubscriptionRenewed(msg.sender, duration);
    }

    function isActive(address user) external view returns (bool) {
        return subscriptions[user] > block.timestamp;
    }
}
