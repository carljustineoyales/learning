#!/usr/bin/env bash

echo "Module Exercise"
# Insturction: copies a source directory to a backup destination

sourceDir=$1
destinationDir=$2

# TODO: check if both arguments are provided
if [[ -z "${sourceDir}" || -z ${destinationDir} ]]; then
  echo "Usage $0 <source> <destination>" >&2
  exit 1
fi

# TODO: Check source directory actually exists
if [[ ! -d "${sourceDir}" ]]; then
  echo "Error: source directory not found: ${sourceDir}" >&2
  exit 1
fi

# TODO Check source directory is readable
if [[ ! -r "${sourceDir}" ]]; then
  echo "Error: source directory is not readable: ${sourceDir}" >&2
  exit 1
fi

# TODO: if ALL checks pass run the backup
mkdir ${destinationDir}
cp -r ${sourceDir} ${destinationDir}
echo "Backup complete: ${sourceDir} -> ${destinationDir}"