docker build -t server:latest .
aws ecr get-login --no-include-email --region us-east-1 > dylg.sh
#echo "ls" > dyld.sh

chmod 777 dylg.sh

./dylg.sh

docker tag server:latest $ECS_DOCKER_LOCATION.dkr.ecr.us-east-1.amazonaws.com/server:$BUILD_NUMBER
docker tag server:latest $ECS_DOCKER_LOCATION.dkr.ecr.us-east-1.amazonaws.com/server:latest

docker push $ECS_DOCKER_LOCATION.dkr.ecr.us-east-1.amazonaws.com/server:$BUILD_NUMBER
docker push $ECS_DOCKER_LOCATION.dkr.ecr.us-east-1.amazonaws.com/server:latest

