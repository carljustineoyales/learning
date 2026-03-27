#!/usr/bin/env bash

echo "Module 3: User Input and Output"
echo "Part 5: Pipes"

ls | wc -l #count files in current directory
cat /etc/passwd | grep "cjoyales" #find a user
ps aux | grep "firefox" #find a running process


