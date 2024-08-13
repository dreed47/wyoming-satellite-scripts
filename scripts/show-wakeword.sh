#!/bin/bash

# Define the service file location
SERVICE_FILE="/etc/systemd/system/wyoming-satellite.service"

# Extract the wake-word-name value
wake_word=$(grep -- '--wake-word-name' "$SERVICE_FILE" | sed -n "s/.*--wake-word-name '\([^']*\)'.*/\1/p")

# Check if the extraction was successful
if [ -n "$wake_word" ]; then
    echo "$wake_word"
else
    echo "Wake word not found."
fi
