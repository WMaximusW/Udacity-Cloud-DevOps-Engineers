# Udacity-Cloud-DevOps-Engineers
For projects

# Note
- In projects folder, i'm using the code from project 01
- I do not copy the folder 'fontawesome' because of many files in that folder, it will slows the progress

# Credit
- Using draw.io for diagram

# cd to folder tools

# Create Stack
# Network
./create.sh trungnq72-network ../starters/network.yml ../starters/network-params.json
./create.sh trungnq72-service ../starters/udagram.yml ../starters/udagram-params.json
./create.sh trungnq72-store ../starters/store.yml ../starters/store-params.json

# Update Stack
# Network
./update.sh trungnq72-network ../starters/network.yml ../starters/network-params.json
./update.sh trungnq72-service ../starters/udagram.yml ../starters/udagram-params.json

# Delete Stack
# Network
./delete.sh trungnq72-network
./delete.sh trungnq72-service
./delete.sh trungnq72-store

# QnA
1. The S3 i'm trying to add to EC2, can you review the code. Is that the best pratice? Can it be improved?
2. EnvironmentName in S3 is lower-case only. So what is the name format for everything?
3. For deleting S3, is the lambdra function work for emptying bucket?
