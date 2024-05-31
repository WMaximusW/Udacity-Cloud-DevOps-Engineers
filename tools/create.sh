aws cloudformation create-stack --stack-name $1 \
    --template-body file://$2   \
    --parameters file://$3  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=us-east-1

# Wait for the stack creation to complete
aws cloudformation wait stack-create-complete --stack-name $1 --region us-east-1

STACK_STATUS=$(aws cloudformation describe-stacks --stack-name $1 --region us-east-1 --query "Stacks[0].StackStatus" --output text)

if [ "$STACK_STATUS" == "CREATE_COMPLETE" ]; then
    echo "Stack creation was successful!"
else
    echo "Stack creation failed with status: $STACK_STATUS"

    echo "Press any key to continue..."
    read -n 1 -s
fi

