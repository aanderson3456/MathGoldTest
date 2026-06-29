# Kaggle Competition Handover: MathGold (Freestyle Category)

This document serves as the master reference for our upcoming Kaggle competition entry in the **Freestyle** category. It combines standard Kaggle workflows ("corn-fed" commands and artifacts) with the specific strategy and architecture of our **MathGold** submission.

---

## 1. Standard Kaggle Workflows & Tools

Since you haven't competed since the March Madness competition, here is a refresher on the essential tools and CLI commands.

> [!IMPORTANT]
> **API Key Reminder:** Never hardcode your `kaggle.json` credentials in your scripts or push them to GitHub. The Kaggle CLI expects your token to be located securely at `~/.kaggle/kaggle.json` (with `chmod 600`).

### Essential Kaggle CLI Commands

1. **Authentication & Setup**
   - Ensure your token is in `~/.kaggle/kaggle.json`.
   - Test authentication: `kaggle config view`

2. **Interacting with Competitions**
   - **List active competitions:**
     ```bash
     kaggle competitions list
     ```
   - **Download competition data:**
     ```bash
     kaggle competitions download -c <competition-name>
     unzip <competition-name>.zip -d data/
     ```

3. **Managing Datasets (For Model Fine-tuning)**
   - **Download external datasets (e.g., Lean 4 tactic datasets):**
     ```bash
     kaggle datasets download -d <owner>/<dataset-name>
     ```
   - **Create a new dataset (to share MathGold formalized proofs):**
     ```bash
     kaggle datasets init -p /path/to/dataset
     # Edit the generated dataset-metadata.json
     kaggle datasets create -p /path/to/dataset
     ```

4. **Submitting to the Leaderboard**
   - **Submit predictions/results:**
     ```bash
     kaggle competitions submit -c <competition-name> -f submission.csv -m "MathGold V1 - LLM Guided Search"
     ```
   - **Check submission status and score:**
     ```bash
     kaggle competitions submissions -c <competition-name>
     ```

### Standard Artifacts from the "Class"
- **`submission.csv`**: The required format for most competitions.
- **`notebook.ipynb`**: Your exploratory data analysis (EDA) and model training code.
- **Kaggle Kernels (Notebooks)**: Cloud environments with free GPU/TPU quotas. Perfect for running lightweight Gemma models for tactic prediction.

---

## 2. Our Submission: MathGold (Freestyle Category)

Our entry is a unique fusion of blockchain consensus and machine learning. We are submitting **MathGold**—a hybrid Proof-of-Work cryptocurrency where mining consists of verifying useful Lean 4 mathematical proofs (UPoW).

### The Kaggle Connection
We are applying insights from the recent Kaggle class to build ML-driven automated provers that outpace brute-force mining:

1. **LLM-Guided Tactical Search**
   - **Goal:** Fine-tune lightweight models (like Gemma 2B/7B) to predict the next best Lean 4 tactics (`omega`, `aesop`, `ring`, `exact`) based on the current mathematical goal state.
   - **Kaggle Execution:** We can use Kaggle's free GPUs to fine-tune these models on historical Lean proof datasets.

2. **Proof Difficulty Estimation**
   - **Goal:** Train regression models to predict the computation time and memory footprint of a candidate proof.
   - **Why?** To prevent our Lean sandbox validator from hitting out-of-memory errors and optimize our UPoW block rewards.

3. **Heuristic Search Optimizations**
   - **Goal:** Implement Reinforcement Learning (RL) and Monte Carlo Tree Search (MCTS) over Lean's proof trees to significantly improve solver efficiency.

### MathGold Formalization Portfolio
Our submission will highlight our formalized mathematical bounds. Our current portfolio includes:
- **GeometricWaste.lean**: Proves standard SHA-256 consensus waste grows linearly with difficulty.
- **RandomOracle.lean**: Proves that no heuristic outperforms uniform random selection when querying an idealized hash function (Brute Force Indifference Theorem).
- **VT_Codes.lean**: Proves optimal bounds for insertion/deletion error correction using Varshamov-Tenengolts checksums.

### Next Steps for the Competition
1. **Prepare the Dataset:** Package our Lean 4 formalizations (`MathGoldFormalization/`) into a Kaggle Dataset.
2. **Train the Prover:** Spin up a Kaggle Notebook with GPU acceleration to fine-tune Gemma on Lean tactic prediction.
3. **Format the Submission:** For the Freestyle category, our submission will likely be a comprehensive Kaggle Notebook demonstrating the ML-guided prover solving a complex Lean theorem, bundled with a write-up on how this powers the MathGold consensus engine.
