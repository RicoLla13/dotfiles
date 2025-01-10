#!/bin/bash

# Get the date of the last upgrade from pacman.log and remove brackets and time zone info
last_upgrade_date=$(grep -i "upgraded" /var/log/pacman.log | tail -1 | awk '{print $1}' | tr -d '[]')

# Convert the date to a format `date` can parse
last_upgrade_date=$(date -d "${last_upgrade_date}" +%Y-%m-%d)

# Get the current date in seconds since epoch
current_date_seconds=$(date +%s)

# Convert last upgrade date to seconds since epoch
last_upgrade_seconds=$(date -d "$last_upgrade_date" +%s)

# Calculate the difference in days
days_ago=$(( (current_date_seconds - last_upgrade_seconds) / 86400 ))

if [[ $1 ==  "--days-since" ]]; then
    echo "$days_ago days since the last system upgrade."
    exit 0
fi

if [[ $days_ago -ge 7 ]]; then
    echo "      === System update advised ===" 
    echo "             $days_ago days passed"
else
    echo "      === Pacman is up to date ==="
fi
