#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 2: Numeric Test"

a=1
b=1
c=0

echo '${a} -eq ${b}'
if [[ "${a}" -eq "${b}" ]]; then
  echo "This will appear if a and b are equal"
fi

echo '${a} -ne ${c}'
if [[ "${a}" -ne "${c}" ]]; then
  echo "This will appear if a and c are not equal"
fi

echo '${c} -lt ${a}'
if [[ "${c}" -lt "${a}" ]]; then
  echo "This will appear if c is less than a"
fi

echo '${c} -le ${a}'
if [[ "${c}" -le "${a}" ]]; then
  echo "This will appear if c is less than or equal to a"
fi

echo '${a} -gt ${c}'
if [[ "${a}" -gt "${c}" ]]; then
  echo "This will appear if a is greater than c"
fi

echo '${a} -ge ${c}'
if [[ "${a}" -ge "${c}" ]]; then
  echo "This will appear if a is greater than or equal to c"
fi