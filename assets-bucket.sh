DATAGLITTER_ASSETS_S3_BUCKET={DATAGLITTER_ASSETS_S3_BUCKET:-assets}

aws cloudformation $1-stack \
    --stack-name dataglitter-assets \
    --template-body file://${PWD}/cf/assets-bucket-setup.yaml \
    --parameters ParameterKey=AssetsBucketName,ParameterValue=$DATAGLITTER_ASSETS_S3_BUCKET \
    --profile prod
