#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 4: Logical Operators"

a=yes
b=yes
path="./module_45.md"

echo '[[ "${a}" == "yes" && "${b}" == "yes" ]] both mush be true'
if [[ "${a}" == "yes" && "${b}" == "yes" ]]; then
  echo "Both is true"
fi
echo '[[ "${a}" == "yes" || "${b}" == "yes" ]] at least one must be true'
if [[ "${a}" == "yes" || "${b}" == "yes" ]]; then
  echo "Atleast one is true"
fi
echo '[[ ! -f "${path}" ]] negate -> true if file does NOT exists'
if [[ ! -f "${path}" ]]; then
  echo "File does not exists"
fi

