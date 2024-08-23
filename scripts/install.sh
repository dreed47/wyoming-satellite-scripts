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

cd ~
echo "..."
echo "${YELLOW}Cloning repos...${RESET}"
git clone https://github.com/rhasspy/wyoming-satellite.git
git clone https://github.com/rhasspy/wyoming-openwakeword.git
git clone https://github.com/fwartner/home-assistant-wakewords-collection.git

echo "..."
echo "${YELLOW}Installing speaker drivers...${RESET}"
cd ~/wyoming-satellite/  
sudo bash etc/install-respeaker-drivers.sh  

echo "..."
echo "${YELLOW}Installing python requirements for satellite...${RESET}"  
python3 -m venv .venv
.venv/bin/pip3 install --upgrade pip
.venv/bin/pip3 install --upgrade wheel setuptools
.venv/bin/pip3 install \
  -f 'https://synesthesiam.github.io/prebuilt-apps/' \
  -r requirements.txt \
  -r requirements_audio_enhancement.txt \
  -r requirements_vad.txt

echo "..."
echo "${YELLOW}Installing python requirements for wakeword...${RESET}"  
cd ~/wyoming-openwakeword
script/setup

cd ~/wyoming-satellite/examples/  

python3 -m venv --system-site-packages .venv
.venv/bin/pip3 install --upgrade pip
.venv/bin/pip3 install --upgrade wheel setuptools
.venv/bin/pip3 install 'wyoming==1.5.2' 

echo "..."
echo "${YELLOW}Setup alternate wakewords...${RESET}"  
mkdir ~/wakewords
find ~/home-assistant-wakewords-collection -type f -name "*.tflite" -exec mv {} ~/wakewords/ \;
rm -rvf ~/home-assistant-wakewords-collection

sudo mv ~/wakewords /opt
sudo mv ~/wyoming-satellite /opt
sudo mv ~/wyoming-openwakeword /opt

echo "..."
echo "${YELLOW}Setup services...${RESET}"  
sudo wget -O /etc/systemd/system/wyoming-satellite.service https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/systemctl/wyoming-satellite.service
sudo wget -O /etc/systemd/system/wyoming-openwakeword.service https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/systemctl/wyoming-openwakeword.service
sudo wget -O /etc/systemd/system/2mic_leds.service https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/systemctl/2mic_leds.service
sudo systemctl daemon-reload
sudo systemctl enable 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service
sudo systemctl start 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  
#sudo systemctl restart 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  
#sudo systemctl status 2mic_leds.service wyoming-openwakeword.service wyoming-satellite.service  

echo "${YELLOW}Downloading bash aliases...${RESET}"
curl -sSfL https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/.bash_aliases -o ~/.bash_aliases

echo "${YELLOW}Downloading logrotate custom file...${RESET}"
curl -sSfL https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/logrotate/custom -o /etc/logrotate.d/custom

echo " "
echo "${GREEN}Script execution completed.  Consider rebooting to make sure your system is using the installed speaker drivers. ${RESET}"
