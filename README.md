# Importing Existing Resources to new CloudFormation stacks.

This repository is a POC for using newly launched `ImportExistingResources` feature of AWS CloudFormation ChangeSet API.

### What problems does this feature solve?

- Refactoring of a CloudFormation stack that exceeded the maximum number of CloudFormation resources (500 at the time of this article's writing).
- The need to segregate stateful (DynamoDB, S3, SQS, MemoryDB, RDS, etc) vs disposable resources (Lambda, API Gateway, StepFunctions) between multiple CloudFormation stacks.
- The need to convert a POC project that contained both stateful and disposable compute resources in a single CloudFormation stack to comply with production compliance rules of an organization.
- To regroup stateful resources into multiple independent/nested stacks
- To improve deployment efficiency and reduce risk of accidental deletion of stateful resources.
- Recover from accidental deletion of CloudFormation stacks that contained stateful resources (DynamoDB, SQS, S3 Buckets, RDS, etc) tagged with `DeletionPolicy: Retain`

### Links

- [How to Import Existing Resources in your CloudFormation Stacks](https://dev.to/aws-builders/how-to-import-existing-resources-in-your-cloudformation-stacks-1a4n)
