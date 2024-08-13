#!/usr/bin/env bash
# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

echo "${YELLOW}Downloading bash aliases...${RESET}"
curl -sSfL https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/.bash_aliases -o ~/.bash_aliases

echo "${YELLOW}Reloading ~/.bashrc...${RESET}"
source ~/.bashrc

echo " " 
echo "${GREEN}Script execution completed.${RESET}"
