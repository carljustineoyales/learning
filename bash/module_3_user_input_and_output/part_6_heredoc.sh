#!/usr/bin/env bash

echo "Module 3: User Input and Output"
echo "Part 6: Here Documents (Heredoc)"
cat <<EOF 
This is line one
This is line two
Hello, ${USER}
EOF

cat <<EOF > ./part_6_output.txt
host=localhost
port=3000
user=${USER}
EOF

