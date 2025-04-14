// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyPolygonNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;
    uint256 public mintPrice = 0.01 ether;

    
    constructor() ERC721("MyPolygonNFT", "MPNFT") Ownable(msg.sender) {}

    function mintNFT(string memory tokenURI) external payable {
        require(msg.value >= mintPrice, "Insufficient MATIC sent");

        uint256 tokenId = nextTokenId;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);
        nextTokenId++;
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function setMintPrice(uint256 newPrice) external onlyOwner {
        mintPrice = newPrice;
    }
}
