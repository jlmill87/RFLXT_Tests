// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./BaseUpgradeable.sol";

contract NFTMarketplace is BaseUpgradeable {
    struct NFTListing {
        address seller;
        uint256 price;
        bool active;
    }

    mapping(uint256 => NFTListing) public listings;

    event NFTListed(uint256 indexed tokenId, address indexed seller, uint256 price);
    event NFTSold(uint256 indexed tokenId, address indexed buyer, uint256 price);

    function listNFT(uint256 tokenId, uint256 price) external onlyAdmin {
        listings[tokenId] = NFTListing(msg.sender, price, true);
        emit NFTListed(tokenId, msg.sender, price);
    }

    function buyNFT(uint256 tokenId) external payable {
        NFTListing storage listing = listings[tokenId];
        require(listing.active, "NFT not listed");
        require(msg.value == listing.price, "Incorrect price");

        listing.active = false;
        payable(listing.seller).transfer(msg.value);

        emit NFTSold(tokenId, msg.sender, msg.value);
    }
}
