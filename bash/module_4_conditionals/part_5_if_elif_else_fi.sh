#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 5: IF / ELIF/ ELSE / FI"

read -p "Enter a number: " num

if [[ "${num}" -gt 100 ]]; then
  echo "Greater than 100"
elif [[ "${num}" -gt 50 ]]; then
  echo "Greater than 50"
elif [[ "${num}" -gt 0 ]]; then
  echo "Positive"
else
  echo "Zero or negative"
fi