# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset colors

export WYOMING_SATELLITE_SCRIPT_RELEASE='release'

alias m='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/menu.sh)"'
alias menu='bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/$WYOMING_SATELLITE_SCRIPT_RELEASE/scripts/menu.sh)"'

PROMPT_COMMAND='history -a'
