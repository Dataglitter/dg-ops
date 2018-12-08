KEY_NAME={KEY_NAME:-keyname}
VPC_ID={VPC_ID:-vpc-id}
SUBNET_ID={SUBNET_ID:-subnet-id}
DESIRED_CAPACITY={DESIRED_CAPACITY:-1}
MAX_SIZE={MAX_SIZE:-1}
INSTANCE_TYPE={INSTANCE_TYPE:-t2.medium}
DATAGLITTER_ASSETS_S3_BUCKET={DATAGLITTER_ASSETS_S3_BUCKET:-assets}
DOCKER_HUB_SECRET_ARN={DOCKER_HUB_SECRET_ARN:-arn:aws:secretsmanager:xxxxxxxx}

aws cloudformation $1-stack \
    --stack-name dataglitter-ecs-cluster \
    --template-body file://${PWD}/cf/ecs-cluster.yaml \
    --parameters \
        ParameterKey=KeyName,ParameterValue=$KEY_NAME \
        ParameterKey=VpcId,ParameterValue=$VPC_ID \
        ParameterKey=SubnetId,ParameterValue=$SUBNET_ID \
        ParameterKey=DesiredCapacity,ParameterValue=$DESIRED_CAPACITY \
        ParameterKey=MaxSize,ParameterValue=$MAX_SIZE \
        ParameterKey=InstanceType,ParameterValue=$INSTANCE_TYPE \
        ParameterKey=AssetsS3Bucket,ParameterValue=$DATAGLITTER_ASSETS_S3_BUCKET \
        ParameterKey=DockerHubSecretARN,ParameterValue=$DOCKER_HUB_SECRET_ARN \
    --capabilities CAPABILITY_IAM \
    --profile prod
