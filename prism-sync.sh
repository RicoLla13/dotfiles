#!/bin/bash

RCLONE_REMOTE="gdrive-sync:/forever_mc/saves"
LOCAL_DIR="$HOME/.local/share/PrismLauncher/instances/Forever_Fun/minecraft/saves"
PRISM_BIN="/usr/bin/prismlauncher"

echo "[i] Syncing from cloud..."
rclone sync "$RCLONE_REMOTE" "$LOCAL_DIR" --progress

echo "[i] Starting PrismLauncher..."
"$PRISM_BIN" "$@"

echo "[i] Syncing to cloud..."
rclone sync "$LOCAL_DIR" "$RCLONE_REMOTE" --progress

echo "[i] Syncing complete. Exiting..."
