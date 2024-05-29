aws cloudformation update-stack --stack-name $1  \
    --template-body file://$2   \
    --parameters file://$3  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=us-east-1

echo "Press any key to continue..."
read -n 1 -s