RFLXT Smart Contracts Suite
Table of Contents

1. Introduction
2. Features
3. Smart Contracts Overview
4. Deployment Instructions
5. Testing and Interaction
6. Upgradeability
7. Roadmap
8. License

Introduction

RFLXT.com leverages blockchain technology to enhance the gaming and creator economy, providing tools for creators, gamers, and developers to interact seamlessly. This repository includes smart contracts that power features like staking, subscriptions, NFT marketplaces, governance, and rewards.

Features

The RFLXT Smart Contracts Suite includes:
- ERC-20 Token Management: Handle the core RFLXT token with staking and burning functionality.
- NFT Marketplace: Enable NFT listing, trading, and royalty distribution.
- Subscription Management: Automate subscriptions for access to premium features and content.
- Creator Node Rewards: Distribute rewards to creators and node operators dynamically.
- Referral System: Encourage user acquisition through referrals.
- Governance: Facilitate community voting on platform upgrades and proposals.
- Token-Gated Access: Unlock exclusive in-game features and content using tokens or NFTs.
- Dynamic Rewards: Adjust staking rewards based on platform metrics.

Smart Contracts Overview
Core Contracts

1. RFLXTToken.sol  
   - Manages the ERC-20 token, including minting, staking, and burning.  
   - Supports voting and treasury management.

2. BaseUpgradeable.sol  
   - Provides the foundation for upgradeable contracts with role-based access control.

Feature-Specific Contracts

1. NFTMarketplace.sol  
   - Facilitates NFT listing, trading, and royalty payments.

2. SubscriptionManager.sol  
   - Handles subscriptions for platform features and token-gated access.

3. CreatorNodeRewards.sol  
   - Distributes rewards to creators and node operators based on performance.

4. ReferralSystem.sol (Planned)  
   - Rewards referrals for user acquisition and engagement.

5. Governance.sol (Planned)  
   - Enables community voting on platform changes and upgrades.

6. TokenGatedAccess.sol  
   - Unlocks exclusive features based on wallet contents.

7. DynamicRewards.sol  
   - Adjusts staking rewards dynamically to incentivize participation.

Deployment Instructions

### Prerequisites
1. Install Node.js and MetaMask.
2. Use Remix or a local development environment like Hardhat for compilation and deployment.
3. Fund your wallet with testnet ETH for deployment on public testnets.

### Steps for Deployment
1. Compile Contracts:
   - Use Remix or a local environment to compile all `.sol` files.
2. Deploy BaseUpgradeable:
   - Deploy `BaseUpgradeable.sol` first and initialize with an admin address.
3. Deploy Feature Contracts:
   - Deploy other contracts (`NFTMarketplace`, `SubscriptionManager`, etc.), passing the `BaseUpgradeable` address where necessary.
4. Verify Deployments:
   - Use the contract addresses to interact with deployed contracts via Remix or a frontend.

Testing and Interaction

### Testing in Remix
1. Interact with contracts via the Deployed Contracts section.
2. Test:
   - Token transfers (RFLXTToken).
   - NFT listings and purchases (NFTMarketplace).
   - Reward claims (CreatorNodeRewards).
   - Subscriptions (SubscriptionManager).

### Frontend Integration
Use libraries like Web3.js or ethers.js to interact with these contracts from your frontend.

Upgradeability

The contracts are built with the Transparent Proxy Pattern using OpenZeppelin's libraries. This allows you to:
- Update logic without redeploying.
- Preserve the state and address of deployed contracts.

Steps for upgrading:
1. Deploy the new implementation contract.
2. Update the proxy contract to point to the new implementation.

Roadmap

- [x] Implement core token functionality.
- [x] Add staking and rewards.
- [x] Develop modular NFT marketplace.
- [x] Integrate subscription management.
- [ ] Launch governance system.
- [ ] Finalize referral rewards system.
- [ ] Test and deploy to mainnet.

License

This project is licensed under the MIT License.

Verified Contracts on SKALE Testnet

The following contracts have been deployed and verified on the SKALE Giant Half Dual Testnet. Each contract supports the RFLXT ecosystem and demonstrates advanced EVM smart contract capabilities.

RFLXT_Token

**Address**: [0x4b7b8C877c57D56d65C8ab4B64CB3Dc4A0898028](https://giant-half-dual-testnet.explorer.testnet.skalenodes.com/address/0x4b7b8C877c57D56d65C8ab4B64CB3Dc4A0898028?tab=txs)
**Description**: The core ERC-20 token implementation for the RFLXT platform, supporting staking, burning, and treasury management.

BaseUpgradeable

**Address**: [0xD50C99E27923Ccb34949166538594310d46Ed8ec](https://giant-half-dual-testnet.explorer.testnet.skalenodes.com/address/0xD50C99E27923Ccb34949166538594310d46Ed8ec)
**Description**: A foundational upgradeable smart contract providing role-based access control and initializable functionality.

NFT Marketplace

**Address**: [0xCBDc2877b4879045A535E376b91b676D53E41108](https://giant-half-dual-testnet.explorer.testnet.skalenodes.com/address/0xCBDc2877b4879045A535E376b91b676D53E41108)
**Description**: A decentralized marketplace for listing, trading, and managing NFTs with royalty distribution.

Subscription Manager

**Address**: [0xA3BC28d9738ED6BF7411427b240DA9c6902f76aC](https://giant-half-dual-testnet.explorer.testnet.skalenodes.com/address/0xA3BC28d9738ED6BF7411427b240DA9c6902f76aC)
**Description**: Manages token-based subscriptions and gated access to premium platform features.

CreatorNodeRewards

**Address**: [0x8d1711CAff0CEC79818d71f0e70e80F9706CC6BA](https://giant-half-dual-testnet.explorer.testnet.skalenodes.com/address/0x8d1711CAff0CEC79818d71f0e70e80F9706CC6BA)
**Description**: Manages dynamic rewards distribution for creators and node operators.
