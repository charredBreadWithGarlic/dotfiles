#!/bin/bash

# Function: Display Usage
usage() {
    # $0 resolves to the name of the script as it was called/invoked
    echo "Usage: $0 <process_name> <target_time> [--deamon]"
    echo "Options:"
    echo "  --deamon    Run the script in the background"
    echo "Example: $0 steam 23:00 --deamon"
    exit 1
}

# Parse arguments
DAEMON_MODE=fales
PROCESS_NAME=""
TARGET_TIME=""

# $# is the number of arguments, -gd bash for > (since > is pipeing)
while [[ $# -gt 0 ]]; do
    case "$1" in
        --deamon) # ')' opens match branch
            DAEMON_MODE=true
            shift # shift removes the first argument from the arg[]
            ;;
        *) # default state
            if [[ -z "$PROCESS_NAME" ]]; then # check if $PROCESS_NAME is empty
                PROCESS_NAME="$1"
            elif [[ -z "$TARGET_TIME" ]]; then
                TARGET_TIME="$1"
            else
                usage
            fi
            shift
            ;;
    esac 
done

# Validate input existence, here basic posics tests `[ ]` are sufficent
if [[ -z "$PROCESS_NAME" ]] || [[ -z "$TARGET_TIME" ]]; then
    usage
fi

# Validate process name, checks on the exit status of pgrep (equivalent: $?)
if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Error: Process '$PROCESS_NAME' not found."
    exit 1
fi

# Validate time format
hours=$(echo "$TARGET_TIME" | cut -d: -f1)
minutes=$(echo "$TARGET_TIME" | cut -d: -f2)

if ((hours < 0 || hours > 23 || minutes < 0 || minutes > 59)); then
    echo "Invalid time range/format. Use 24-hour format HH:MM (eg.: 23:00)"
    exit 1
fi

# Function: calculate seconds till SIGTERM
calculate_sleep_time() {
    # get current time, '+' for padding with '0'
    current_time=$(date +"%H:%M")

    # convert times to seconds
    current_seconds=$(date -d "$current_time" +"%s")
    target_seconds=$(date -d "$TARGET_TIME" +"%s")

    # Calculate time difference
    time_diff=$((target_seconds - current_seconds))

    # if time_diff negative then target_time is on the next day
    # -> add 24h in seconds: 86400
    if [ $time_diff -le 0 ]; then
        time_diff=$((time_diff + 86400))
    fi

    echo $time_diff
}

# Function: shutdown process
terminate() {
    echo "Initiating gracefull shutdown of $PROCESS_NAME at $(date)"

    # gracefull shutdown
    pkill -SIGTERM -x "$PROCESS_NAME"

    # Wait 20 seconds for the process to shut down
    sleep 20

    # See if process did indeed shut down
    if pgrep -x "$PROCESS_NAME" > /dev/null; then
        echo "Process $PROCESS_NAME did not exit. Sending SIGKILL."
        pkill -SIGKILL -x "$PROCESS_NAME"
    fi
}

# Calculate sleep time
sleep_time=$(calculate_sleep_time)
echo "Waiting $(($sleep_time / 3600)) hours, $(($sleep_time % 3600 / 60)) minutes until process termination"
sleep $sleep_time

# Check if process is still running
if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Error: Process '$PROCESS_NAME' already terminated."
    exit 1
fi

# Perform termination 
terminate
