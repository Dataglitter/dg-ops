ECS_CLUSTER=dataglitter-ecs-cluster-ECSCluster-11H501Q7VZLK8  # Needs to be the created ECS cluster name
CLOUDWATCH_LOG_GROUP=ECSLogGroup-dataglitter-ecs-cluster
MONGO_DB_IMAGE=dataglitter/mongo:3.4
POST_SERVICE_IMAGE=dataglitter/dg-post-service:1.4.2
FRONT_END_IMAGE=dataglitter/dg-ui:1.4.2
KEY_STORE_PASSWORD=
KEY_PASSWORD=
JWT_SECRET=

aws cloudformation create-stack \
    --stack-name dataglitter-app \
    --template-body file://${PWD}/operations/cf/task-definition.yaml \
    --parameters \
        ParameterKey=ECSCluster,ParameterValue=$ECS_CLUSTER \
        ParameterKey=CloudwatchLogsGroup,ParameterValue=$CLOUDWATCH_LOG_GROUP \
        ParameterKey=MongoDbImage,ParameterValue=$MONGO_DB_IMAGE \
        ParameterKey=PostServiceImage,ParameterValue=$POST_SERVICE_IMAGE \
        ParameterKey=FrontEndImage,ParameterValue=$FRONT_END_IMAGE \
        ParameterKey=KeyStorePassword,ParameterValue=$KEY_STORE_PASSWORD \
        ParameterKey=KeyPassword,ParameterValue=$KEY_PASSWORD \
        ParameterKey=JwtSecret,ParameterValue=$JWT_SECRET \
    --profile prod
