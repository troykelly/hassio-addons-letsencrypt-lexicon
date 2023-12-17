#!/bin/bash

json_file="providers.json"  # Replace with your actual JSON file path
output_file="config_schema.yaml"  # Output file name

echo "Generating configuration schema from JSON..."

# Start by writing the static part of the schema
cat > "$output_file" << EOF
schema:
  email: email
  updatedelay: int?
  domains:
    - str
  certfile: str
  keyfile: str
  dns:
    provider: list(
EOF

# Append the provider list to the schema
providers=$(jq -r 'keys[]' "$json_file" | paste -sd "|" -)
echo "      $providers)?" >> "$output_file"

# Append the options for each provider
echo "    # Provider specific options" >> "$output_file"
for provider in $(jq -r 'keys[]' "$json_file"); do
    jq -r --arg provider "$provider" '.[$provider] | keys[]' "$json_file" |
    while IFS= read -r key; do
        # Append each option with the provider prefix
        echo "    ${provider}_${key}: str?" >> "$output_file"
    done
done

echo "Configuration schema generated in $output_file"
