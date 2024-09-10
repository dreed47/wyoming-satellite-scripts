#!/bin/bash

# Directory containing the wake words
wakeword_dir="/opt/wakewords"

# Service file to be modified
service_file="/etc/systemd/system/wyoming-satellite.service"
wakeword_service_file="/etc/systemd/system/wyoming-openwakeword.service"

# Get the terminal height (number of rows)
#terminal_height=$(tput lines)
terminal_height=30

# Calculate the number of visible menu items (leaving space for a prompt)
visible_items=$((terminal_height - 2))

# Check if the wakeword directory exists
if [[ ! -d "$wakeword_dir" ]]; then
    echo "Directory $wakeword_dir not found!"
    exit 1
fi

# Get the list of files in the wakeword directory
files=("$wakeword_dir"/*)

# Function to display the menu with paging
display_menu() {
    clear
    start=$((page * visible_items))
    end=$((start + visible_items))
    
    if [[ $end -gt ${#files[@]} ]]; then
        end=${#files[@]}
    fi

    echo "Select a wake word file (Page $((page + 1))):"
    
    for i in $(seq $start $((end - 1))); do
        if [[ $i -eq $selected ]]; then
            echo "> ${files[$i]##*/}"
        else
            echo "  ${files[$i]##*/}"
        fi
    done
    
    echo -e "\nUse Up/Down keys to navigate, Enter to select, PgUp/PgDn to scroll."
}

# Initialize the selection
selected=0
page=0
max_pages=$(( (${#files[@]} + visible_items - 1) / visible_items ))

display_menu

# Read user input and navigate the menu
while true; do
    read -rsn1 input
    case $input in
        $'\x1b') # Detect arrow key presses
            read -rsn2 -t 0.1 input
            case $input in
                '[A') # Up arrow
                    ((selected--))
                    if [[ $selected -lt 0 ]]; then
                        ((selected=0))
                    elif [[ $selected -lt $((page * visible_items)) ]]; then
                        ((page--))
                        display_menu
                    fi
                    ;;
                '[B') # Down arrow
                    ((selected++))
                    if [[ $selected -ge ${#files[@]} ]]; then
                        ((selected=${#files[@]} - 1))
                    elif [[ $selected -ge $((start + visible_items)) ]]; then
                        ((page++))
                        display_menu
                    fi
                    ;;
                '[5') # Page Up (PgUp key)
                    ((page--))
                    if [[ $page -lt 0 ]]; then
                        page=0
                    fi
                    selected=$((page * visible_items))
                    display_menu
                    ;;
                '[6') # Page Down (PgDn key)
                    ((page++))
                    if [[ $page -ge $max_pages ]]; then
                        page=$((max_pages - 1))
                    fi
                    selected=$((page * visible_items))
                    display_menu
                    ;;
            esac
            ;;
        '') # Enter key
            break
            ;;
    esac

    display_menu
done

# Extract the selected file name without extension
selected_file="${files[$selected]}"
wake_word_name="$(basename "$selected_file" | sed 's/\.[^.]*$//')"

# Perform find/replace on the service files
sudo sed -i "s/--wake-word-name '[^']*'/--wake-word-name '$wake_word_name'/" "$service_file"
sudo sed -i "s/--preload-model '[^']*'/--preload-model '$wake_word_name'/" "$wakeword_service_file"

echo "Updated the wake word in $service_file to $wake_word_name"
