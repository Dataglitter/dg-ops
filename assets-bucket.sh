DATAGLITTER_ASSETS_S3_BUCKET=dataglitter-assets

aws cloudformation create-stack \
    --stack-name dataglitter-assets \
    --template-body file://${PWD}/operations/cf/assets-bucket-setup.yaml \
    --parameters ParameterKey=AssetsBucketName,ParameterValue=$DATAGLITTER_ASSETS_S3_BUCKET \
    --profile prod
