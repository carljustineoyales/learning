#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 6: Short Circuit Pattern"

echo "runs echo only if mkdir succeded"
mkdir /tmp/backups && echo "Directory created"

echo "runs echo only if mkdir failed"
mkdir /tmp/backups || echo "Failed to create a dir"