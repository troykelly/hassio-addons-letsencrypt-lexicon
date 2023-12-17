#!/bin/bash

json_file="providers.json"  # Replace with your actual JSON file path
output_file="providers.md"  # Output markdown file

echo "Generating documentation from JSON..."

# Start with an empty output file
echo "" > "$output_file"

# Read each provider and its options from the JSON file
providers=$(jq -r 'keys[]' "$json_file")

for provider in $providers; do
# shellcheck disable=SC2129
    echo "### $provider" >> "$output_file"
    echo "" >> "$output_file"
    echo '```yaml' >> "$output_file"
    echo "dns:" >> "$output_file"
    echo "  provider: $provider" >> "$output_file"

    # Retrieve and write options for the provider
    options=$(jq -r --arg provider "$provider" '.[$provider] | keys[]' "$json_file")
    for key in $options; do
        value=$(jq -r --arg provider "$provider" --arg key "$key" '.[$provider][$key]' "$json_file" | tr '[:lower:]' '[:upper:]')
        echo "  ${provider}_${key}: ${value}" >> "$output_file"
    done

    echo '```' >> "$output_file"
    echo "" >> "$output_file"
done

echo "Documentation generated in $output_file"
