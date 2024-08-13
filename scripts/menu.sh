#!/bin/bash

# Load menu functions
source <(curl -s https://raw.githubusercontent.com/dreed47/wyoming-satellite-scripts/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/menu_functions.sh)


# Define the menu options and their corresponding commands
declare -A options
options=(
    ["Reload services"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/service-reload.sh)"'
    ["Select Wakeword"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/select-wakeword.sh)"'
    ["Show Current Wakeword"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/show-wakeword.sh)"'
    ["Refresh Wakeword List"]='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/refresh-wakeword-list.sh)"'
)

# Array of option labels, including the Quit option
option_labels=("Reload services"
               "Select Wakeword"
               "Show Current Wakeword"
               "Refresh Wakeword List"
               "Quit")


# Call the main menu function
main_menu
