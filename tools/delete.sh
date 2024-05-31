aws cloudformation delete-stack --stack-name $1 --region us-east-1 

# Wait for the stack creation to complete
aws cloudformation wait stack-delete-complete --stack-name $1 --region us-east-1