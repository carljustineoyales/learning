#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log_info() { echo "[INFO] $*";}
log_error() { echo "[ERROR] $*" >&2; }

read -p "Enter a directory to inspect: " target_dir

if [[ ! -d "${target_dir}" ]]; then
  log_error "Directory does not exist: ${target_dir}"
  exit 1
fi

file_count=$(ls "${target_dir}" | wc -l)

log_info "Directory: ${target_dir}"
log_info "Contains ${file_count} items"
echo -e "${GREEN}Done.${NC}"