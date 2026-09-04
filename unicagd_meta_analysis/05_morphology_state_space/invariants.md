# UNICAGD System Invariants Analysis

### HARD INVARIANTS
1. **Cryptographic Digest Invariance**: SHA-256 and SHA3-512 calculated directly from file bytes strictly match manifest declarations across all versions.
2. **Cross-Layer Non-Downward Authority**: `no_downward_projection` from governance to analytical core is enforced across all 289X configurations.
3. **Clinical Authority Prohibition**: AI is structurally barred from executing final medical diagnosis or medication prescription.

### SOFT INVARIANTS
1. **Markov Mixing Time**: Ergodic regime transition with spectral gap ~0.15 relaxing within 6-7 steps.

### ASSUMED INVARIANTS
1. **Chronological Version Monotonicity**: Assumed that version numbers increase with timestamp. (BROKEN in 260X vs 255X).

### BROKEN INVARIANTS
1. **Protobuf Format Invariance**: Broken in `UNICAGD_260X.pb`, which is raw JSON text instead of protobuf binary.
2. **Signature Key Attestation**: Broken in Sites `UNICAGD_289X.signature.json` (32 bytes stub instead of 64 bytes).
