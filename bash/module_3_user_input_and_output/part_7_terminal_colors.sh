#!/usr/bin/env bash

echo "Module 3: User Input and Output"
echo "Part 7: Terminal Colours"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'    # No colour — resets back to normal

echo -e "${GREEN}Success!${NC}"
echo -e "${RED}Error: Something went wrong.${NC}"
echo -e "${YELLOW}Warning: proceed with caution.${NC}"