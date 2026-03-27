#!/usr/bin/env bash

echo "Module 3: User Input and Output"
echo "Part 4: Standard Streams"

echo "Hello" > output.txt # > overwrite
echo "Appended" >> output.txt # >> append

ls /fake/path 2> errors.txt #send stderr to a file
ls /fake/path 2> /dev/null #discard errors entirely
ls /fake/path > out.txt 2>&1 # send both stdout and stderr to the same file
