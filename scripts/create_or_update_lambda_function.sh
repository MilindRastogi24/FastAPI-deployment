echo "This is the image tag to be used: $SHA"
if aws lambda get-function --function-name fastapi_app; then
  echo "Updating Lambda function code..."
  aws lambda update-function-code --function-name fastapi_app \
    --image-uri 637423521355.dkr.ecr.ap-south-1.amazonaws.com/milind/fastapi:$SHA
else
  echo "Creating new Lambda function 'fastapi_app'..."
  aws lambda create-function --function-name fastapi_app \
    --package-type Image \
    --code ImageUri=637423521355.dkr.ecr.ap-south-1.amazonaws.com/milind/fastapi:$SHA \
    --role arn:aws:iam::637423521355:role/lambda-execution-role \
    --region ap-south-1
fi