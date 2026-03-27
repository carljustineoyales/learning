#!/usr/bin/env bash

echo "Module 3: User Input and Output"
echo "Part 3: Getting Input from the User"
read -p "Enter your name: " name
echo "Hello, ${name}!"

read -p "Enter your name: " name #-p shows a prompt inline
read -s -p "Enter password: " pass #-s hides input (silent flag)
read -t 10 -p "Enter value: " value #-t times out after 10 seconds