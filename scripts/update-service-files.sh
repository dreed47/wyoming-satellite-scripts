#!/usr/bin/env bash
# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

echo "..."
echo "..."
echo "${YELLOW}Updating service files from github...${RESET}"

sudo wget -O /etc/systemd/system/wyoming-satellite.service https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/systemctl/wyoming-satellite.service
sudo wget -O /etc/systemd/system/wyoming-openwakeword.service https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/systemctl/wyoming-openwakeword.service
sudo wget -O /etc/systemd/system/2mic_leds.service https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/systemctl/2mic_leds.service
sudo systemctl daemon-reload
#sudo systemctl enable 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service
sudo systemctl restart 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  
#sudo systemctl restart 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  
#sudo systemctl status 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  

echo " "
echo "${GREEN}Script execution completed.${RESET}"
