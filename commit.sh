#!/bin/bash

# Default commit message format
default_message_format="[%H:%M:%S %d-%m-%Y "

# Function to display help message
display_help() {
    echo "Usage: $0 [-m|--message <message>]"
    echo "Creates a Git commit with the current date, time, and optionally a custom message."
    echo ""
    echo "Options:"
    echo "  -m, --message <message>   Use <message> as the commit message"
    echo "  -h, --help                Display this help message and exit"
    echo ""
    echo "If no message is provided, commits with a default message format."
    echo "Example: $0 -m 'Fixed issue #123'"
}

# Function to get the current time and format it
get_current_time() {
    date -u +"$default_message_format"
}

# Parse command line arguments
message=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        -m|--message)
            shift
            message="$1"
            ;;
        -h|--help)
            display_help
            exit 0
            ;;
        *)
            echo "Error: Unrecognized option or argument '$1'."
            echo ""
            display_help
            exit 1
            ;;
    esac
    shift
done

# Get the actual timezone of the machine
timezone=$(date +%Z)

# Combine the current time, timezone, and optional message
formatted_time="$(get_current_time)${timezone}]"
if [ -n "$message" ]; then
    formatted_time="${formatted_time} $message"
fi

# Stage all changes for commit
git add .

# Commit with the formatted message
git commit -m "$formatted_time"

echo "Committed with message: $formatted_time"
