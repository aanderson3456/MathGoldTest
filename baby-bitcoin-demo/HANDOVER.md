# Baby Bitcoin: Project Handover & Deployment Guide

## Overview
This document serves as the official handover for the **Baby Bitcoin** visualization project. The overarching goal of this module is to demystify the pseudo-random, opaque nature of cryptographic hashing (like SHA-256) by breaking it down into an interactable, low-bit state-space fractal map. 

By exposing the fundamental chaotic mechanisms, we demonstrate how "gnarly" these math problems are, thereby assuring the public in the transactional integrity of the MathGold network while simultaneously turning it into an engaging, human-centric visual experience.

## Current State & Features
The `baby-bitcoin-demo` folder currently contains a fully functional, browser-based Vanilla JS/HTML/CSS prototype.

### Key Visual & Algorithmic Implementations:
1. **Flat Fractal Canvas:** The 3D perspective rotation has been stripped away. The fractal map of the state space now sits flush with the screen, maximizing visibility and color vibrancy across all 65,536 states.
2. **K-Nearest-Neighbor (KNN) Constellations:** 
   - A highly optimized visual web that connects states based on their intrinsic orbit cycle length rather than geographic proximity.
   - **Global Search:** The search radius encompasses the entire 256x256 board, allowing up to 50 identical orbit states to form brilliant neon connections.
   - **Orbit Equivalence Slider:** Users can expand the equivalence tolerance. A setting of 0 strictly connects identical cycle lengths, while higher settings group similar cycles, bridging isolated orbits.
3. **Auto-Explore (Slow Mode):** 
   - A deterministic path-tracing algorithm that advances exactly **one step per second**, maintaining its trajectory memory across ticks.
   - **Infinite Visited-State Web:** While in Slow Mode, the system overrides the slider to an infinite equivalence radius and restricts KNN searches strictly to *previously visited* nodes. This dynamically spins a spiderweb connecting the comet's head to its chaotic past, highlighting the (lack of) patterns in the pseudo-random function.

## Instructions for the Next Agent
1. **Deployment to Production (`mathgod.org`):** 
   - You will be working in a new, non-test repository. 
   - Integrate the `app.js`, `style.css`, and `index.html` logic into the primary MathGold web application (likely using a modern framework such as Next.js or Vite, depending on the project structure).
   - Ensure the canvas rendering maintains a consistent 60 FPS under the new framework wrapper.
2. **Human-Centric Controls:** 
   - Build out robust settings to prevent animations from moving "10 times too fast for the human eye," as rapid graphical flashing can cause accessibility/epilepsy issues.
3. **Automated Testing:** 
   - Write comprehensive tests (e.g., using Jest or Cypress) to interact with the DOM, manipulate the Orbit Equivalence slider, trigger Auto-Explore, and assert that the underlying state transitions function properly without silent failures.

---

## Theoretical Connections: VT Codes, Shift Registers, & Sloane
As we prepare to deploy this as a UPoW (Useful Proof-of-Work) consensus mechanism, we must integrate the theoretical backing of our Lean 4 formalizations (specifically `VT_Codes.lean`). 

**The Connection:**
- **Shift Registers (LFSR/NLFSR):** The core of our "Baby Bitcoin" state transitions mimics non-linear feedback shift registers. These shift registers iterate states to create pseudo-random orbits and cycles, exactly as visualized on our canvas.
- **Neil Sloane & VT Codes:** Neil Sloane has done foundational work on error-correcting codes, particularly in integer sequences and codes correcting asymmetric/deletion errors. Varshamov-Tenengolts (VT) codes are the premier mathematical structure for correcting single insertion/deletion errors. 
- **The Synergy:** When transmitting or analyzing shift-register sequences (like the orbits in our game), synchronization errors (bits shifting due to deletion) are catastrophic to the sequence's integrity. VT codes provide the optimal mathematical bounds to correct these synchronization shifts. By combining Sloane's analyses of shift register sequences with VT error correction, we can formalize bounds on how resilient these chaotic "Bitcoin" orbits are to data loss, providing a useful computational bounty for the MathGold network.

**Next Steps for Integration:**
- Bind the visualization of cycle lengths (the orbits on the canvas) to the actual Lean 4 VT checksum algorithms.
- Allow users to visually induce an "error" (delete a bit in the state) and watch the VT code mathematically reconstruct the orbit in real-time on the canvas.
