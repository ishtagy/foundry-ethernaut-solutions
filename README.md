# Ethernaut Solutions using Foundry

This repository contains my solutions for the Ethernaut challenges.

## Table of Contents

- [About Ethernaut CTF](#about-ethernaut-ctf)
- [Challenges](#challenges)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## About Ethernaut CTF

[Ethernaut](https://ethernaut.openzeppelin.com/) is a Capture The Ether (CTF) platform for learning and practicing Ethereum smart contract security. The challenges cover a wide range of topics, from simple Solidity vulnerabilities to more complex issues in Ethereum smart contract development.

## Challenges

The solutions for each challenge are organized into their respective directories in this repository

## Usage

You can use the solutions as a reference or study guide to understand how each challenge was solved. Feel free to explore the code, learn from it, and adapt the solutions for your own projects or further experimentation.

### Installation

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/ishtagy/foundry-ethernaut-solutions.git
   ```

2. Fill .env file.(You need to add your RPC_URL and PRIVATE_KEY of your account)

3. On-Chain exploitation

```sh
  forge script script/level{LEVEL_NUMBER}.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast
```
