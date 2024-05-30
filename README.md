# Udacity-Cloud-DevOps-Engineers
For projects

# cd to folder tools

# Create Stack
# Network
./create.sh trungnq72-network ../starters/network.yml ../starters/network-params.json
./create.sh trungnq72-services ../starters/udagram.yml ../starters/udagram-params.json

# Update Stack
# Network
./update.sh trungnq72-network ../starters/network.yml ../starters/network-params.json
./update.sh trungnq72-services ../starters/udagram.yml ../starters/udagram-params.json

# Delete Stack
# Network
./delete.sh trungnq72-network
./delete.sh trungnq72-params