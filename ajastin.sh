#!/bin/bash
# Get the number of minutes to study from the user
read -p "Montako minuuttia opiskellaan: " minutes

# Calculate the end time of the study session
end_time=$(date -d "+$minutes minutes" +%s)

# Loop until the end of the study session
while [[ $(date +%s) -lt $end_time ]]; do
    # Calculate the percentage of time remaining
    remaining=$((($end_time - $(date +%s)) * 100 / (minutes * 60)))
    bar_length=$((100 - 2))
    num_hash=$((bar_length * (100 - remaining) / 100))
    num_dot=$((bar_length - num_hash))
    # Print a progress bar
    printf "["
    for (( i=0; i<num_hash; i+=1 )); do printf "#" ; done
    for (( i=0; i<num_dot; i+=1 )); do printf "." ; done
    printf "] %d%%\r" $((100 - remaining))

    # Sleep for one second before updating the progress bar
    sleep 1
done

# Print a message when the study session is complete
echo "Aika loppui! Aika levätä :)"
