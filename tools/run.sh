#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete.
#   $2: prefix code (ex: trungnq72)
# Usage examples:
#   ./run.sh deploy 
#   ./run.sh delete

# Validate parameters
if [[ $1 != "deploy" && $1 != "delete" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete." >&2
    exit 1
fi

# Execute CloudFormation CLI: deploy
if [ $1 == "deploy" ]
then
    echo "#1. Deploy network"
    sh ./create.sh $2-network ../starters/network.yml ../starters/network-params.json

    echo "#2. Create S3" #using same udagram-params.json
    sh ./create.sh $2-store ../starters/store.yml ../starters/store-params.json

    echo "#3. Upload project from folder projects"
    aws s3 cp ../projects s3://$2-project02-bucket-s3/ --recursive

    echo "#4. Deploy services"
    sh ./create.sh $2-service ../starters/udagram.yml ../starters/udagram-params.json
fi

# Execute CloudFormation CLI: delete
if [ $1 == "delete" ]
then
    echo "#1. Delete services"
    sh ./delete.sh $2-service

    echo "#2. Delete S3"
    sh ./delete.sh $2-store #Note: i have to empty store the S3 manually. For automation, i found that i can use lambdra functions for that, but i dont know it yet

    echo "#3. Delete network"
    sh ./delete.sh $2-network
fi

echo "Press any key to continue..."
read -n 1 -s