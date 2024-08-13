#!/usr/bin/env bash
# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

#echo "${YELLOW}Downloading menu_functions.sh...${RESET}"
#curl -sSfL https://github.com/dreed47/local-echo/raw/main/scripts/menu_functions.sh -o ~/menu_functions.sh

#echo "${YELLOW}Downloading menu.sh...${RESET}"
#curl -sSfL https://github.com/dreed47/local-echo/raw/main/scripts/menu.sh -o ~/menu.sh

#chmod 777 ~/menu.sh

echo "${YELLOW}Downloading bash aliases...${RESET}"
curl -sSfL https://github.com/dreed47/local-echo/raw/main/scripts/.bash_aliases -o ~/.bash_aliases

echo "${YELLOW}Reloading ~/.bashrc...${RESET}"
source ~/.bashrc

echo " " 
echo "${GREEN}Script execution completed.${RESET}"
