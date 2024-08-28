#!/usr/bin/env bash
# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

export WYOMING_SATELLITE_SCRIPT_RELEASE='release'

echo "..."
echo "..."
echo "${YELLOW}Updating package lists and perform upgrades...${RESET}"
sudo apt-get update && sudo apt-get upgrade -y

echo "..."
echo "${YELLOW}Installing tools...${RESET}"
sudo apt-get install -y --no-install-recommends  \
  git \
  python3-venv \
  libopenblas-dev \
  python3-spidev \
  python3-gpiozero \
  ncdu


echo "${YELLOW}Downloading bash aliases...${RESET}"
curl -sSfL https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/.bash_aliases -o ~/.bash_aliases

echo "${YELLOW}Downloading logrotate custom file...${RESET}"
sudo curl -sSfL https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/logrotate/custom -o /etc/logrotate.d/custom

echo "${YELLOW}Downloading latest ncdu tool...${RESET}"
wget https://dev.yorhel.nl/download/ncdu-2.5-linux-arm.tar.gz
tar -xzf ncdu-2.5-linux-arm.tar.gz
rm -rvf ncdu-2.5-linux-arm.tar.gz 
sudo mv ~/ncdu /usr/bin
curl -sSfL https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/ncdu/ncdu.conf -o /etc/ncdu.conf

echo " "
echo "${GREEN}Script execution completed.  Consider rebooting to make sure your system is using the installed speaker drivers. ${RESET}"
