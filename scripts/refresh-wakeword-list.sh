#!/usr/bin/env bash
# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

echo "..."
echo "..."
echo "${YELLOW}Refresh wakeword list...${RESET}"  

cd ~
git clone https://github.com/fwartner/home-assistant-wakewords-collection.git
mkdir ~/wakewords
find ~/home-assistant-wakewords-collection -type f -name "*.tflite" -exec mv {} ~/wakewords/ \;
rm -rvf ~/home-assistant-wakewords-collection

sudo rm -rf /opt/wakewords && sudo mv -f ~/wakewords /opt

echo " "
echo "${GREEN}Script execution completed.   ${RESET}"
