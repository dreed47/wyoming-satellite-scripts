# Define colors for status messages
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

alias m='bash -c "$(wget -qLO - https://github.com/dreed47/local-echo/raw/main/scripts/menu.sh)"'

PROMPT_COMMAND='history -a'
