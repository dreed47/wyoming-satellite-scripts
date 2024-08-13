#!/usr/bin/env bash
# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

echo "..."
echo "${YELLOW}Reload services...${RESET}"  
sudo systemctl daemon-reload
#sudo systemctl enable 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service
#sudo systemctl start 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  
sudo systemctl restart 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  
#sudo systemctl status 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  

echo " "
echo "${GREEN}services reloaded. ${RESET}"
