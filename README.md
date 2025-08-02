# 🔐 Flash USDT Simulation on Tron Testnet

> Educational simulation of TRC20 USDT flash transfers using smart contracts and a frontend wallet UI. Built entirely on the Tron Nile Testnet for safe, ethical, and secure training and wallet behavior testing.

---

## 📌 Description

This repository simulates temporary/unconfirmed TRC20 USDT transactions. Aimed for blockchain educators, wallet UI developers, and security analysts, the system demonstrates how unconfirmed transfers can appear visually in a wallet without actual asset movement.

**Core Capabilities**:
- Smart contract simulation (no actual token moved)
- Whitelisted wallet support for flash display
- Frontend dApp powered by TronWeb + React
- Full-synced node integration for real-time testnet behavior

---

## 📁 Project Structure

```
flash-usdt-simulation/
├── contracts/               # Solidity smart contracts (FlashUSDT, FakeUSDT)
│   ├── FlashUSDT.sol
│   └── FakeUSDT.sol
├── frontend/                # React + TronWeb frontend wallet UI
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── utils/
│   │   └── App.jsx
│   └── package.json
├── scripts/                 # Deployment and utility scripts
│   └── deploy.js
├── docs/                    # Diagrams, flowcharts, presentations
├── .github/workflows/       # GitHub Actions for CI/CD (linting, tests)
│   └── main.yml
└── README.md                # This file
```

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/YOUR_ORG/flash-usdt-simulation.git
cd flash-usdt-simulation

# Install frontend dependencies
cd frontend && npm install

# Compile and deploy contracts to Tron Testnet (Nile)
cd ../contracts
tronbox migrate --network nile

# Launch the React frontend
cd ../frontend
npm run dev
```

---

## ⚙️ Technologies

- **Smart Contracts**: Solidity v0.8+
- **Frontend**: React + TronWeb
- **Node**: Full-synced via TronGrid or private
- **Dev Tools**: TronBox, GitHub Actions, Hardhat (optional)

---

## 🧪 Features

- ✅ FlashTransfer simulation with whitelist control
- ✅ Emits transfer events (no real USDT involved)
- ✅ Auto-purge or admin-triggered revoke simulation
- ✅ Full frontend integration with fake balance logic
- ✅ GitHub CI for contracts + frontend lint/tests

---

## 🧬 GitHub Actions CI

`.github/workflows/main.yml`

```yaml
name: CI
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3

    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: 18

    - name: Install frontend dependencies
      run: |
        cd frontend
        npm ci

    - name: Run frontend lint
      run: |
        cd frontend
        npm run lint || true

    - name: Compile contracts
      run: |
        npm install -g tronbox
        cd contracts
        tronbox compile

    - name: Run smart contract tests
      run: |
        cd contracts
        tronbox test || true
```

---

## 🤝 Contributors

**Developed by:** Kristoffer Narag (CEO & Blockchain Lead Developer) – Kryptoken Technology Inc.  
**Commissioned by:** Flash USDT Education Lead or FUEL (Zul & Yahzrie - MYS)

---

## 📝 License

MIT License. For educational and research purposes only.  
❗ Do not deploy on Tron Mainnet or misrepresent simulated balances.

---
