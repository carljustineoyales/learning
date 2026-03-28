#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 3: File tests"

filepath="./module_4.md"
dirpath="./"
path="./module_4.md"
exe="./part_1_string_test.sh"

echo '-f ${filepath}'
if [[ -f "${filepath}" ]]; then
  echo "This is a regular file"
fi

echo '-d ${dirpath}'
if [[ -d "${dirpath}" ]]; then
  echo "This is a directory"
fi

echo '-e ${path}'
if [[ -e "${path}" ]]; then
  echo "Checks if file or directory exists"
fi

echo '-r ${path}'
if [[ -r "${path}" ]]; then
  echo "Checks if readable"
fi

echo '-w ${path}'
if [[ -w "${path}" ]]; then
  echo "Checks if writable"
fi

echo '-x ${exe}'
if [[ -x "${exe}" ]]; then
  echo "Checks if executable"
fi