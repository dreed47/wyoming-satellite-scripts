#!/bin/bash

# Load menu functions
#source ~/menu_functions.sh
source <(curl -s https://raw.githubusercontent.com/dreed47/local-echo/main/scripts/menu_functions.sh)

# Define the menu options and their corresponding commands
declare -A options
options=(
    ["Reload services"]='bash -c "$(wget -qLO - https://github.com/dreed47/local-echo/raw/main/scripts/service-reload.sh)"'
    ["Select Wakeword"]='bash -c "$(wget -qLO - https://github.com/dreed47/local-echo/raw/main/scripts/select-wakeword.sh)"'
    ["Show Current Wakeword"]='bash -c "$(wget -qLO - https://github.com/dreed47/local-echo/raw/main/scripts/show-wakeword.sh)"'
    ["Reinstall menu functions"]='bash -c "$(wget -qLO - https://github.com/dreed47/local-echo/raw/main/scripts/menu-install.sh)"'
)

# Array of option labels, including the Quit option
option_labels=("Reload services"
               "Select Wakeword"
               "Show Current Wakeword"
               "Reinstall menu functions"
               "Quit")


# Call the main menu function
main_menu
