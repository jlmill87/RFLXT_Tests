// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract BaseUpgradeable is Initializable, AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    function initialize(address admin) public initializer {
        _grantRole(DEFAULT_ADMIN_ROLE, admin); // Default admin role
        _grantRole(ADMIN_ROLE, admin);        // Custom admin role
    }

    modifier onlyAdmin() {
        require(hasRole(ADMIN_ROLE, msg.sender), "BaseUpgradeable: Not an admin");
        _;
    }
}
