#!/bin/bash

# Load menu functions
source <(curl -s https://raw.githubusercontent.com/dreed47/wyoming-satellite-scripts/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/menu_functions.sh)


# Define the menu options and their corresponding commands
declare -A options
options=(
    ["Reload services"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/service-reload.sh)"'
    ["Select Wakeword"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/select-wakeword.sh)"'
    ["Show current Wakeword"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/show-wakeword.sh)"'
    ["Refresh Wakeword list"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/refresh-wakeword-list.sh)"'
    ["Edit wyoming-satellite service file"]='sudo systemctl edit --force --full wyoming-satellite.service'
    ["Edit wyoming-wakeword service file"]='sudo systemctl edit --force --full wyoming-openwakeword.service'
    ["Edit 2mic_leds service file"]='sudo systemctl edit --force --full 2mic_leds.service'
    ["Update service files from github"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/update-service-files.sh)"'
)

# Array of option labels, including the Quit option
option_labels=(
               "Select Wakeword"
               "Show current Wakeword"
               "Refresh Wakeword list"
               "Edit wyoming-satellite service file"
               "Edit wyoming-wakeword service file"
               "Edit 2mic_leds service file"
               "Update service files from github"
               "Reload services"
               "Quit")


# Call the main menu function
main_menu
