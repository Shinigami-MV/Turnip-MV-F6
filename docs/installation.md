# Installation Guide - Turnip-MV-F6

## Requirements

- POCO F6 (Adreno 735)
- Winlator Ludashi

## Important note about the download

If you download from **GitHub Actions**, the file is an **artifact ZIP**.

You must **extract it first**. Inside you will find the real driver package, for example:

```text
Turnip-MV-F6-R2-Performance.zip   ← import this one in Ludashi
Turnip-MV-F6-R2-Performance.zip.sha256
```

Do **not** import the outer artifact ZIP directly.

---

## Steps

1. Download the artifact from Actions (or a Release if available).
2. **Extract** the downloaded ZIP.
3. Take the inner driver ZIP.
4. Open **Winlator Ludashi**.
5. Go to **Driver Manager** / **AdrenoTools**.
6. Import the inner driver ZIP.
7. Select the matching driver name (R1 Stability or R2 Performance).
8. Restart the container / game.

---

## If something looks unstable

Try one change at a time:

1. `TU_DEBUG=sysmem`
2. `WRAPPER_BLIT=1`
3. Switch back to **F6-R1 Stability**
4. Different DXVK version

See `docs/recommended-settings.md` for more detail.

---

## Backup

Always keep a known-good driver as backup before testing experimental builds.
