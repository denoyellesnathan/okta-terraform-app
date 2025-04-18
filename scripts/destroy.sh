#!/bin/bash

# Pass the environment (e.g., dev, prod) as a parameter to the script
ENVIRONMENT=$1

# Check if the parameter is provided
if [ -z "$ENVIRONMENT" ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

# Use the parameter to dynamically create the command
terraform apply -var-file=env/${ENVIRONMENT}.tfvars -destroy
