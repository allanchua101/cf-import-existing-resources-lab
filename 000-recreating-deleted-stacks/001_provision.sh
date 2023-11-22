#!/bin/bash

# AWS CLI command to create a CloudFormation stack
aws cloudformation create-stack \
    --stack-name "pets-state-stores" \
    --template-body file:///$PWD/large-template.cfn.yaml \
    --capabilities CAPABILITY_IAM \
    --region "ap-southeast-1" \
    --profile ac