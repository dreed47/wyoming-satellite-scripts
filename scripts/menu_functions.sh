#!/bin/bash


# Define colors for status messages
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0) # Reset color

# Function to display the menu
display_menu() {
    clear
    echo "${GREEN}VOICE ASSIST MENU${RESET}"

    # Print the dashes without a newline
    echo -n "${GREEN}------------------"

    # Conditionally append the code branch only if it's not 'release'
    if [[ "$WYOMING_SATELLITE_SCRIPT_RELEASE" != "release" ]]; then
        echo -n "${RED} (code branch:$WYOMING_SATELLITE_SCRIPT_RELEASE)"
    fi

    # Reset color and move to the next line
    echo "${RESET}"
        
    echo "${YELLOW}Select an option (use arrow keys to navigate and Enter to select):${RESET}"
    for i in "${!option_labels[@]}"; do
        if [[ $i -eq $1 ]]; then
            echo -e "\e[1;32m> ${option_labels[$i]}\e[0m"
        else
            echo "  ${option_labels[$i]}"
        fi
    done
}

# Function to handle menu selection
handle_selection() {
    if [[ $1 -lt ${#option_labels[@]}-1 ]]; then
        echo "Executing: ${option_labels[$1]}"
        eval "${options[${option_labels[$1]}]}"
        echo -e "\nPress any key to exit..."
        read -n 1 -s
    else
        clear
        echo "Exiting menu..."
    fi
}

# Main menu loop
main_menu() {
    local current_selection=0
    while true; do
        display_menu $current_selection

        read -rsn1 input
        if [[ $input == $'\x1b' ]]; then
            read -rsn2 -t 0.1 input
            if [[ $input == "[A" ]]; then
                # Up arrow key
                ((current_selection--))
                if [[ $current_selection -lt 0 ]]; then
                    current_selection=$((${#option_labels[@]} - 1))
                fi
            elif [[ $input == "[B" ]]; then
                # Down arrow key
                ((current_selection++))
                if [[ $current_selection -ge ${#option_labels[@]} ]]; then
                    current_selection=0
                fi
            fi
        elif [[ $input == "" ]]; then
            handle_selection $current_selection
            [[ ${option_labels[$current_selection]} == "Quit" ]] && break
        fi
    done
}
