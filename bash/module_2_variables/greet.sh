#!/usr/bin/env bash

set -u

name=$1 
age=$2
predict=$3

if [[ -z "${name}" ]]; then
  echo "Usage: $0 <name> <age> <Number of years added>"
  exit 1
fi

echo "Hello ${name}! You are ${age} years old"
echo "In 10 years time you will be $(( age + predict )) years old"
