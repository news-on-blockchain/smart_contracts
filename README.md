# Decentralized News Platform - Blockchain Implementation

![Blockchain News Platform](https://imgur.com/example-banner.png)

A fully decentralized news platform built on Ethereum blockchain using Hardhat, featuring anonymous authorship, token-based rewards, and decentralized content storage.

## Table of Contents
1. [Features](#features)
2. [Tech Stack](#tech-stack)
3. [Project Structure](#project-structure)
4. [Setup & Installation](#setup--installation)
5. [Smart Contract Deployment](#smart-contract-deployment)
6. [Testing](#testing)
7. [Frontend Integration](#frontend-integration)
8. [Security Considerations](#security-considerations)
9. [Troubleshooting](#troubleshooting)
10. [License](#license)

## Features
- 🛡️ Decentralized article storage using IPFS
- 💰 ERC20 token reward system (NEWS)
- 🔒 Anonymous authorship with blockchain pseudonymity
- 💸 Token redemption for ETH
- 🔄 Admin-controlled token minting
- 📜 Immutable article records
- 💡 Tipping system for quality content

## Tech Stack
- **Blockchain**: Ethereum
- **Development**: Hardhat
- **Smart Contracts**: Solidity (0.8.x)
- **Token Standard**: ERC20
- **Storage**: IPFS
- **Testing**: Chai, Mocha
- **Frontend**: React + ethers.js (sample)

## Project Structure
/news-platform
├── contracts
│ ├── NewsToken.sol
│ └── NewsContract.sol
├── scripts
│ ├── deploy.js
│ └── verify.js
├── test
│ └── News.test.js
├── hardhat.config.js
├── .env
└── frontend (sample)
├── src
│ ├── components
│ └── App.js
└── package.json

## Setup & Installation

### Prerequisites
- Node.js (v16.x+)
- Hardhat
- MetaMask Wallet
- IPFS Client (e.g., web3.storage)

1. **Clone Repository**
```bash
git clone https://github.com/your-username/news-platform.git
cd news-platform
Install Dependencies
```
```bash
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npm install @openzeppelin/contracts dotenv @nomiclabs/hardhat-etherscan
```
Environment Setup
Create .env file:

```env
PRIVATE_KEY=Your_Private_Key
ETHERSCAN_API_KEY=Your_Etherscan_API_Key
```
Hardhat Configuration
Update hardhat.config.js:

```javascript
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.20",
  networks: {
    goerli: {
      url: `https://eth-goerli.g.alchemy.com/v2/${process.env.ALCHEMY_KEY}`,
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
};
```
Compile Contracts

```bash
npx hardhat compile
Smart Contract Deployment
Test Network Deployment
Deploy NewsToken
```
```bash
npx hardhat run scripts/deploy-news-token.js --network goerli
Deploy NewsContract
```
```bash
npx hardhat run scripts/deploy-news-contract.js --network goerli
```
Mainnet Deployment
```bash
npx hardhat run scripts/deploy.js --network mainnet
```