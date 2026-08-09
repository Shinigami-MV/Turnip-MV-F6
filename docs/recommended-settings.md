# Recommended Settings - POCO F6 + Turnip-MV-F6

Priority device: **POCO F6** (Snapdragon 8s Gen 3 / **Adreno 735**)
Frontend: **Winlator Ludashi**

## Which driver to use

| Build | Use when |
|-------|----------|
| **F6-R1 Stability** | First choice for daily testing / fewer risks |
| **F6-R2 Performance** | When you want to chase FPS and compare vs R1 |

Always keep a known-good backup driver.

## Starting point

1. Import the inner driver ZIP (extract Actions artifact first if needed).
2. Graphics Driver: **Wrapper**
3. Select the F6 driver in Driver Manager / AdrenoTools.
4. Present Mode: **Fifo**
5. Start with DXVK **2.0-async** if it already works for the game.

### Useful environment variables

Try one at a time only when needed:

| Variable | When to use |
|----------|-------------|
| `TU_DEBUG=sysmem` | Artifacts, hangs, tiling glitches |
| `WRAPPER_BLIT=1` | Corrupted swapchain / UI presentation |
| `TU_DEBUG=nolrz` | Still unstable after sysmem |

### Comparing R1 vs R2

Use the **same**:

- game + scene
- resolution
- DXVK
- Box64 preset
- FPS limit

Record:

- average FPS / 1% lows
- temperature after 5–10 minutes
- artifacts / crashes

## UE4 anime-style games

Start with **F6-R1 Stability**.
If stable, try **F6-R2 Performance** on the same scene.
If glitches appear, prefer `TU_DEBUG=sysmem` before abandoning the build.
