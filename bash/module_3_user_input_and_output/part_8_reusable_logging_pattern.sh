#!/usr/bin/env bash

echo "Module 3: User Input and Output"
echo "Part 8: Reusable Logging Pattern"

log_info() { echo "[INFO] $*"; } #$* means "all arguments passed to the function" 
log_warn() { echo "[WARN] $*" >&2; }
log_error() { echo "[ERROR] $*" >&2; } # log_warn and log_error use >&2 — they write to stderr, not stdout.

# usage
log_info  "Starting backup..."
log_warn  "Destination is almost full"
log_error "Source directory not found"