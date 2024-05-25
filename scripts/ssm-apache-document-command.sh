#!/bin/bash

aws resource-groups list-group-resources \
    --group-name "Development-EC2-Resources" \
    --query 'ResourceIdentifiers[?ResourceType==`AWS::EC2::Instance`].ResourceArn' \
    --output json | jq -r '.[] | split("/") | .[-1]' > instance_ids_${BUILD_NUMBER}.txt

# Print the instance IDs
cat instance_ids_${BUILD_NUMBER}.txt

# Print the instance IDs in the format required by the SSM document
mapfile -t ids < instance_ids_${BUILD_NUMBER}.txt

# Convert the array to a string
output=$(printf ", \"%s\"" "${ids[@]}")

# Remove the leading comma and space
output=${output:2}

# Print the instance IDs in the format required by the SSM document
echo $output