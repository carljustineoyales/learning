#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 1: String Test"

a="test"
b="test"
c=""
echo '${a} == ${b}' 
if [[ "${a}" == "${b}" ]]; then
  echo "This will appear if a and b is equal"
fi

echo '${a} != ${b}'
if [[ "${a}" == "${b}" ]]; then
  echo "This will appear if a and b is not equal"
fi

echo ' -z ${c}'
if [[ -z ${c} ]]; then
  echo "This will appear if string is empty"
fi

echo '-n ${a}'
if [[ -n "${a}" ]]; then
  echo "This will appear if string is not empty"
fi

echo '${a} =~ ^[0-9]+$'
if [[ "${a}" =~ ^[0-9]+$ ]]; then
  echo "This will appear if string matcher regex"
fi

