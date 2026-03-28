#!/usr/bin/env bash

echo "Module 4: Conditionals"
echo "Part 7: Case statements"

echo "Cleaner than long if/elif chains"

read -p "Enter a day (mon/tue/wed): " day

case "${day}" in
  mon)
    echo "Monday - start of the week"
    ;;
  tue)
    echo "Tuesday"
    ;;
  wed)
    echo "Wednesday - half way there"
    ;;
  sat|sun)
    echo "Weekends"
    ;;
  *)
    echo "Weekday"
    ;;
esac
