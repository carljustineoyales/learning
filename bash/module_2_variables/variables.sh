#!/usr/bin/env bash


echo "Part 1: Declaring variables"
name="Alice"
age=30
echo ""

echo "Reading variables"
echo $name #works
echo ${name} #better - use braces for clarity
echo "${name}" #best - always quote your variables
echo ""

echo "Part 2: Command Substitution"
current_date=$(date '+%Y-%m-%d')
file_count=$(ls | wc -l)

echo "Today is ${current_date}"
echo "Files here: ${file_count}"
echo ""

echo "Part 3: Arithmetic"
x=10
y=3
sum=$(( x + y ))
product=$(( x * y ))
remainder=$(( x % y ))

echo "Sum: ${sum}"
echo "Product: ${product}"
echo "Remainder: ${remainder}"
echo "Decimals"
result=$(echo "scale=2; 10 / 3" | bc)
echo "${result}"
echo ""
