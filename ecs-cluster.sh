KEY_NAME=dataglitter
VPC_ID=vpc-81188de5
SUBNET_ID=subnet-e86cdbb0
DESIRED_CAPACITY=1
MAX_SIZE=1
INSTANCE_TYPE=t2.medium
DATAGLITTER_ASSETS_S3_BUCKET=dataglitter-assets

aws cloudformation create-stack \
    --stack-name dataglitter-ecs-cluster \
    --template-body file://${PWD}/operations/cf/ecs-cluster.yaml \
    --parameters \
        ParameterKey=KeyName,ParameterValue=$KEY_NAME \
        ParameterKey=VpcId,ParameterValue=$VPC_ID \
        ParameterKey=SubnetId,ParameterValue=$SUBNET_ID \
        ParameterKey=DesiredCapacity,ParameterValue=$DESIRED_CAPACITY \
        ParameterKey=MaxSize,ParameterValue=$MAX_SIZE \
        ParameterKey=InstanceType,ParameterValue=$INSTANCE_TYPE \
        ParameterKey=AssetsS3Bucket,ParameterValue=$DATAGLITTER_ASSETS_S3_BUCKET \
    --capabilities CAPABILITY_IAM \
    --profile prod
