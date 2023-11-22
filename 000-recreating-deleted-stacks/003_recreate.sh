#!/bin/bash

# Define variables
stack_name="pets-state-stores"
template_file="$PWD/large-template.cfn.yaml"
region="ap-southeast-1"
profile="ac"
change_set_name="change-set-$(date +%s)"

# Create a change set
aws cloudformation create-change-set \
    --stack-name "$stack_name" \
    --change-set-type "CREATE" \
    --change-set-name "$change_set_name" \
    --template-body "file://$template_file" \
    --capabilities CAPABILITY_IAM \
    --import-existing-resources \
    --region "$region" \
    --profile "$profile"

# Describe the change set (optional)
aws cloudformation describe-change-set \
    --stack-name "$stack_name" \
    --change-set-name "$change_set_name" \
    --region "$region" \
    --profile "$profile"

# Execute the change set
echo "Do you want to execute this change set? (yes/no)"
read execute_decision

if [[ "$execute_decision" == "yes" ]]; then
    aws cloudformation execute-change-set \
        --stack-name "$stack_name" \
        --change-set-name "$change_set_name" \
        --region "$region" \
        --profile "$profile"
    echo "Change set executed."
else
    echo "Change set not executed."
fi
