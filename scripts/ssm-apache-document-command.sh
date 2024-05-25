#!/bin/bash

aws resource-groups list-group-resources \
    --group-name "Development-EC2-Resources" \
    --query 'ResourceIdentifiers[?ResourceType==`AWS::EC2::Instance`].ResourceArn' \
    --output json | jq -r '.[] | split("/") | .[-1]' > instance_ids_${BUILD_NUMBER}.txt

cat instance_ids_${BUILD_NUMBER}.txt