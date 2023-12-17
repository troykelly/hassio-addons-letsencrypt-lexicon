#!/bin/bash

json_file="providers.json"  # Replace with your actual JSON file path
output_file="provider_snippets.md"  # Output markdown file

# Function to convert to uppercase and replace spaces with underscores
to_upper_snake_case() {
    echo "$1" | tr '[:lower:]' '[:upper:]' | sed 's/ /_/g'
}

echo "Generating code snippets..."

# Start with an empty output file
echo "" > "$output_file"

# Begin sections for local definitions and value settings
echo "## Local Variable Definitions" >> "$output_file"
local_definitions=""

echo "## Code Snippets to Set Values" >> "$output_file"
value_settings=""

# Extract providers and their options from JSON
providers=$(jq -r 'keys[]' "$json_file")

for provider in $providers; do
    upper_provider=$(to_upper_snake_case "$provider")
    echo "Processing provider: $provider"

    # Append to local definitions
    local_definitions+="\n# $provider\n"
    options=$(jq -r --arg provider "$provider" '.[$provider] | keys[]' "$json_file")
    for option in $options; do
        upper_option=$(to_upper_snake_case "$option")
        local_definitions+="  local LEXICON_${upper_provider}_${upper_option}\n"
    done

    # Append to value settings
    value_settings+="\n# $provider\n"
    for option in $options; do
        upper_option=$(to_upper_snake_case "$option")
        value_settings+="  if bashio::config.has_value 'dns.${provider}_${option}'; then\n"
        value_settings+="    LEXICON_${upper_provider}_${upper_option}=\$(bashio::config 'dns.${provider}_${option}')\n"
        value_settings+="    export LEXICON_${upper_provider}_${upper_option}\n"
        value_settings+="    bashio::log.info \"Set ${provider}_${option}\"\n"
        value_settings+="  fi\n"
    done
done

# Write sections to file
echo -e "$local_definitions" >> "$output_file"
echo -e "$value_settings" >> "$output_file"

echo "Code snippets generated in $output_file"
