#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete.
#
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
    echo "#1. Create S3" #using same udagram-params.json
    sh ./create.sh trungnq72-store ../starters/udagram.yml ../starters/udagram-params.json

    echo "#2. Upload project from folder projects"
    aws ../projects s3://TrungNQ72-Udagram-Project02-bucket-s3/ --recursive

    echo "#3. Deploy network"
    sh ./create.sh trungnq72-network ../starters/network.yml ../starters/network-params.json

    echo "#4. Deploy services"
    sh ./create.sh trungnq72-service ../starters/udagram.yml ../starters/udagram-params.json
fi

# Execute CloudFormation CLI: delete
if [ $1 == "delete" ]
then
    echo "#1. Delete services"
    sh ./delete.sh trungnq72-service

    echo "#2. Delete network"
    sh ./delete.sh trungnq72-network

    echo "#3. Delete S3"
    sh ./delete.sh trungnq72-store #Note: i have to empty store the S3 manually. For automation, i found that i can use lambdra functions for that, but i dont know it yet
fi