# Patches for Turnip-MV-F6

Place `.patch` files here. They are applied automatically during GitHub Actions builds.

## Policy

- **Priority GPU:** Adreno 735 (POCO F6)
- Prefer stability-validated changes before aggressive hacks
- Avoid unsupported-GPU-only workarounds unless tested on F6

## Current status

- **v1.0 Baseline:** no source patches
- **v1.1 Stability (F6-R1):** no source patches
- **v1.2 Performance (F6-R2):** no source patches yet; performance comes from compiler flags (`-O3` + LTO)

Future game-specific patches can be added here after real device validation.
