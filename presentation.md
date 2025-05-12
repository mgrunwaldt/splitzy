# Splitzy Hackathon Presentation

## Project Overview

*   **Name:** Splitzy
*   **Concept:** A mobile-first expense splitting app leveraging Starknet for optional on-chain settlement and NFT receipts.
*   **Problem Solved:** Simplifies group expense tracking and settlement, adding fairness with smart splitting suggestions.
*   **Target Audience:** Friends, roommates, travel groups.

## Key Features & Technology

*   **Frontend:** Flutter & `starknet.dart` for a native mobile experience and wallet integration.
*   **Backend/Logic:** Cairo smart contract for on-chain settlement (ETH, USDC, WBTC) and NFT receipts on Starknet testnet.
*   **Smart Splitting:** In-app logic analyzes user spending history to suggest fair expense allocations.
*   **Off-chain First:** Group/expense data managed locally for speed and cost-efficiency.
*   **Optional On-chain:** Users can choose to settle balances via Starknet.
*   **NFT Receipts:** Provides verifiable proof of payment.
*   **Demo Mode:** Easy demonstration with sample data and simulated settlements.

## Technical Implementation

*   **`starknet.dart`:** Used for wallet connection, fetching balances, and initiating settlement/minting transactions.
*   **Cairo Contract:**
    *   Manages balances per group (mapping `group_id` => `user_address` => `balance`).
    *   Functions for `settle_debt` (individual or batch).
    *   ERC721 implementation for minting NFT receipts upon settlement.
    *   Handles ETH, USDC, and WBTC (via their respective contract addresses on testnet).
*   **Flutter App:**
    *   State management (Provider, Riverpod, or Bloc).
    *   Local storage (sqflite or Hive) for groups, expenses, and history.
    *   UI components for groups, expense entry, ledger display.
    *   Smart splitting algorithm (details TBD - likely rule-based or simple frequency analysis).

## Demo Plan

1.  Show group creation and adding members.
2.  Add a few expenses, demonstrating manual splitting.
3.  Highlight the smart splitting suggestion based on (simulated) history.
4.  Show the group ledger.
5.  Initiate on-chain settlement using the demo mode (connecting a testnet wallet).
6.  Show the transaction on Starkscan/Voyager.
7.  Show the minted NFT receipt in the wallet/explorer.

## Why Starknet?

*   **Low Gas Fees:** Makes micro-settlements feasible.
*   **Scalability:** Handles potential future growth.
*   **Cairo & Tooling:** Powerful language and ecosystem for contract development.
*   **`starknet.dart`:** Enables seamless integration into a Flutter mobile app.
*   **Account Abstraction:** Potential for future enhancements like social recovery or session keys.

## Future Ideas

*   Direct P2P settlement requests.
*   Recurring expense handling.
*   Integration with other DeFi protocols (e.g., lending against settled balances).
*   More sophisticated ML model for smart splitting.
*   Support for mainnet.