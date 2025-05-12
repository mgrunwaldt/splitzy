# Splitzy - Smart Expense Splitting on Starknet

Splitzy is a mobile app that simplifies group expense sharing. It allows users to track shared costs, leverages past spending patterns for fair splitting suggestions, and offers optional on-chain settlement using Starknet testnet tokens (ETH, USDC, WBTC).

## Features

*   **Mobile-First:** Built with Flutter and starknet.dart.
*   **Group Management:** Create groups, add members, and track expenses.
*   **Smart Splitting:** AI-powered suggestions for fair cost allocation based on history.
*   **Shared Ledger:** Transparent view of who owes whom within each group.
*   **On-Chain Settlement (Optional):** Settle debts directly on Starknet (testnet) using ETH, USDC, or WBTC via a dedicated Cairo smart contract.
*   **NFT Receipts:** Mint NFTs as proof of payment upon settlement.
*   **Demo Mode:** Explore features with pre-populated data and instant testnet settlement simulation.

## Getting Started

### Prerequisites

*   Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
*   Starkli (for contract interaction): [Install Starkli](https://book.starknet.io/chapter_6/starkli.html)
*   Scarb (for Cairo compilation): [Install Scarb](https://docs.swmansion.com/scarb/download)
*   A Starknet wallet (Argent X or Braavos) configured for testnet (Goerli or Sepolia).

### Running the Mobile App

```bash
cd splitzy_app
flutter pub get
flutter run
```

### Deploying the Smart Contract

(Instructions TBD - will involve compiling with Scarb and deploying with Starkli)

```bash
cd splitzy_contract
# Compilation and deployment steps here
```

### Simulating a Test Group

(Instructions TBD - will describe how to use the demo mode)

## Project Structure

*   `/splitzy_app`: Flutter mobile application source code.
*   `/splitzy_contract`: Cairo smart contract source code.
*   `README.md`: This file.
*   `presentation.md`: Hackathon presentation outline.