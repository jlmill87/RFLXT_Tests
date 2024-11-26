// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Import OpenZeppelin Libraries
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract RFLXTToken is AccessControl, Pausable {
    // Token metadata
    string public name = "RFLXT";
    string public symbol = "RFLXT";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Treasury address
    address public treasury;

    // Balances and staking data
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public rewardsClaimed;

    // Governance and NFTs
    mapping(uint256 => NFT) public nfts;
    mapping(address => mapping(uint256 => uint256)) public votes;

    struct NFT {
        string name;
        string uri;
        bool exists;
    }

    uint256 public nftCounter;
    uint256 public totalVotes;

    // Role definitions
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant TREASURY_ROLE = keccak256("TREASURY_ROLE");

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Stake(address indexed staker, uint256 value);
    event Unstake(address indexed staker, uint256 value);
    event RewardPaid(address indexed staker, uint256 reward);
    event NFTMinted(address indexed owner, uint256 nftId, string name, string uri);
    event Voted(address indexed voter, uint256 proposalId, uint256 weight);
    event Burn(address indexed burner, uint256 amount);

    // Constructor: Sets initial supply and roles
    constructor(uint256 initialSupply, address _treasury) {
        // Assign roles
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(TREASURY_ROLE, _treasury);

        // Initialize token supply and treasury
        treasury = _treasury;
        totalSupply = initialSupply * (10 ** decimals);
        balanceOf[msg.sender] = totalSupply;

        // Emit initial transfer event
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // --- Basic Token Functionality ---
    function transfer(address to, uint256 value) public whenNotPaused returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function burn(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance to burn");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
    }

    // --- Pausing ---
    function pause() public onlyRole(DEFAULT_ADMIN_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(DEFAULT_ADMIN_ROLE) {
        _unpause();
    }

    // --- Staking ---
    function stake(uint256 value) public {
        require(balanceOf[msg.sender] >= value, "Insufficient balance to stake");
        balanceOf[msg.sender] -= value;
        stakedBalance[msg.sender] += value;
        emit Stake(msg.sender, value);
    }

    function unstake(uint256 value) public {
        require(stakedBalance[msg.sender] >= value, "Insufficient staked balance");
        stakedBalance[msg.sender] -= value;
        balanceOf[msg.sender] += value;
        emit Unstake(msg.sender, value);
    }

    function claimRewards() public {
        uint256 reward = calculateReward(msg.sender);
        require(balanceOf[treasury] >= reward, "Treasury balance insufficient");
        balanceOf[treasury] -= reward;
        balanceOf[msg.sender] += reward;
        rewardsClaimed[msg.sender] += reward;
        emit RewardPaid(msg.sender, reward);
    }

    function calculateReward(address staker) public view returns (uint256) {
        uint256 rewardRate = 5; // Example reward rate as percentage
        uint256 adjustedRate = rewardRate - ((totalSupply / 1_000_000) / 10); // Dynamic rate adjustment
        return (stakedBalance[staker] * adjustedRate) / 100;
    }

    // --- NFT Minting ---
    function mintNFT(string memory name_, string memory uri_) public onlyRole(MINTER_ROLE) {
        nftCounter++;
        nfts[nftCounter] = NFT(name_, uri_, true);
        emit NFTMinted(msg.sender, nftCounter, name_, uri_);
    }

    // --- Governance ---
    function vote(uint256 proposalId, uint256 weight) public {
        require(balanceOf[msg.sender] >= weight, "Insufficient tokens to vote");
        votes[msg.sender][proposalId] += weight;
        totalVotes += weight;
        emit Voted(msg.sender, proposalId, weight);
    }

    // --- Minting ---
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        uint256 mintAmount = amount * (10 ** decimals);
        balanceOf[to] += mintAmount;
        totalSupply += mintAmount;
        emit Transfer(address(0), to, mintAmount);
    }
}

