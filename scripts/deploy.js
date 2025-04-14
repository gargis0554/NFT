const hre = require("hardhat");

async function main() {
  // Get the signer (deployer) from the wallet connected to Hardhat
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const NFT = await ethers.getContractFactory("MyPolygonNFT");

  const nft = await NFT.deploy();

  console.log("NFT contract deployed to:", nft.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

  