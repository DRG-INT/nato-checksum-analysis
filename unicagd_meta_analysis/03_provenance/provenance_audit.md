# UNICAGD Provenance, Fork & Chain-of-Custody Reconstruction

## 1. Evolution Stages
### Stage: `SEED_LEGACY` | Version: `UNICAGD_25.0.2`
- **Timestamp**: 2026-02-12T04:14:18Z
- **Format**: Plain JSON Cube Tensor (21x21x6 = 2646 cells)

### Stage: `INTERMEDIATE_UPGRADE` | Version: `UNICAGD_255X`
- **Timestamp**: 2026-03-03T09:07:17Z
- **Format**: Google Protobuf Struct wrapping large JSON (2.9 MB JSON, 1.4 MB PB)

### Stage: `ANOMALOUS_BRANCH` | Version: `UNICAGD_260X (model_id: UNICAGD_25.9.0)`
- **Timestamp**: 2026-02-28T07:33:09Z
- **Format**: 11 MB JSON (1700x441 weight matrix), fake plain-text .pb, pseudo-signature
- **[ANOMÁLIA / IDŐKONFLIKTUS]**: Timestamp precedes 255X by 3 days despite higher version number 260X; .pb is raw JSON.

### Stage: `CANONICAL_IOS_RELEASE` | Version: `UNICAGD_289X`
- **Timestamp**: 2026-03-12T00:30:57Z
- **Format**: Custom Protobuf Schema (UNICAGD_288X) + PB2 container + Ed25519 detached signature

### Stage: `HEALTH_DOCTRINE_TRANSFORMATION` | Version: `HEALTH_DOCTRINE_GOVERNED_AI_FROM_UNICAGD_289X`
- **Timestamp**: 2026-06-18
- **Format**: Schema-preserving conversion of 289X into health governance control plane

## 2. Identified Provenance Gaps & Anomalies
1. **Temporal Sequence Inversion**: `260X` generated_utc is `2026-02-28`, whereas `255X` generated_utc is `2026-03-03`. This proves non-linear development, backdating, or parallel branches.
2. **Lineage Skip**: `UNICAGD_289X.json` claims `upgraded_from: UNICAGD_257X` and `version_tag: UNICAGD_257X-UPX-EXTENDED`. Neither `257X` nor `260X` is directly cited as an ancestor in the metadata.
3. **Self-Authentication**: `260X` signature is self-referential (`sha256-release-signature`).
