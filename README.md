RFLXT_Token Smart Contract


This repository contains the RFLXTToken Solidity smart contract, which integrates features like staking, NFT minting, governance, and token management. Designed for use on the Ethereum blockchain, the contract employs OpenZeppelin libraries for secure access control and pausable functionality.

Table of Contents

Features

Technologies Used

Deployment

Usage

Roles and Permissions

Events

License

Features

Token Basics

Name: RFLXT

Symbol: RFLXT

Decimals: 18

Initial Supply: Configurable at deployment

Core Functionalities

Token Transfers: Standard ERC-20-like transfer functionality.

Burning: Allows holders to burn tokens, reducing total supply.

Staking: Stake tokens to earn rewards.

NFT Minting: Create NFTs with metadata and URIs.

Governance: Token-based voting for proposals.

Treasury Management: Tracks treasury allocations for rewards.

Advanced Features

Dynamic Reward System: Rewards adjust based on token supply.

Access Control: Role-based permissions for sensitive actions.

Pausable Contract: Temporarily disable token operations when needed.

Technologies Used

Solidity: v0.8.26

OpenZeppelin Contracts: AccessControl, Pausable

Ethereum Blockchain

Deployment

Requirements:

Solidity compiler (solc) or compatible framework (e.g., Hardhat, Truffle).

Node.js and npm (for dependency management).

Ethereum wallet (e.g., MetaMask).

Install Dependencies:

bash

Copy code

npm install @openzeppelin/contracts

Compile the Contract:

bash

Copy code

npx hardhat compile

Deploy the Contract:

Update the deployment script with:

javascript

Copy code

const initialSupply = "1000000"; // Example: 1,000,000 tokens

const treasuryAddress = "0xYourTreasuryAddress";

Run the script:

bash

Copy code

npx hardhat run scripts/deploy.js --network your-network

Usage

Token Transfers

Transfer tokens between addresses:

solidity

Copy code

function transfer(address to, uint256 value) public returns (bool);

Staking

Stake tokens to earn rewards:

solidity

Copy code

function stake(uint256 value) public;

function unstake(uint256 value) public;

function claimRewards() public;

Minting NFTs

Admins can mint NFTs:

solidity

Copy code

function mintNFT(string memory name_, string memory uri_) public;

Governance

Vote on proposals using tokens:

solidity

Copy code

function vote(uint256 proposalId, uint256 weight) public;

Roles and Permissions

DEFAULT_ADMIN_ROLE: Manages all roles.

MINTER_ROLE: Permission to mint tokens and NFTs.

TREASURY_ROLE: Manages treasury allocations.

Events

The following events are emitted for blockchain transparency:

Transfer: Logs token transfers.

Stake: Logs staking actions.

Unstake: Logs unstaking actions.

RewardPaid: Logs reward distributions.

NFTMinted: Logs new NFT creations.

Voted: Logs governance votes.

Burn: Logs token burns.

License

This project is licensed under the MIT License. 
