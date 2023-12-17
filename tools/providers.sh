#!/bin/bash

input_file="providers.txt"  # Replace with your actual file path
output_file="providers.json"  # Output file name

# Initialize an empty JSON object
echo "{}" > "$output_file"
current_provider=""

while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ $line =~ ^[a-z0-9]+$ ]]; then
        # When a new provider is found, add it to the JSON object
        current_provider=$line
        jq --arg provider "$current_provider" '.[$provider] = {}' "$output_file" > temp.json && mv temp.json "$output_file"
    elif [[ -n "$line" && -n "$current_provider" && $line =~ ^[a-z_]+\  ]]; then
        # Add options to the current provider
        key=$(echo "$line" | awk '{print $1}')
        value=$(echo "$line" | cut -d' ' -f2-)
        jq --arg provider "$current_provider" --arg key "$key" --arg value "$value" '.[$provider][$key] = $value' "$output_file" > temp.json && mv temp.json "$output_file"
    fi
done < "$input_file"

echo "JSON transformation complete. Output saved in $output_file"
