#!/bin/bash

# AWS CLI command to delete a CloudFormation stack
aws cloudformation delete-stack \
    --stack-name  "pets-state-stores" \
    --region "ap-southeast-1" \
    --profile ac