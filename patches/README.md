# Patches for Turnip-MV-F6

Place `.patch` files here. They are applied automatically during GitHub Actions builds.

## Policy for this project

- **Priority GPU:** Adreno 735 (POCO F6)
- Prefer patches that improve **stability first**, then performance
- Avoid broad hacks meant only for unsupported GPUs (e.g. experimental A710/A720-only workarounds) unless validated on F6

## Current status

- **v1.0 Baseline:** no source patches
- **v1.1 Stability (F6-R1):** no source patches yet (A735 is upstream-supported). Focus is packaging + recommended settings for Ludashi on F6

Future **F6-R2** may introduce carefully chosen Adreno 735 performance patches after testing.
