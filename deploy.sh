set -e

IMAGE_NAME="my-app-image"
CONTAINER_NAME="my-app-container"
PORT=3001

docker build -t $IMAGE_NAME .

docker run -d --name $CONTAINER_NAME -p $PORT:3001 $IMAGE_NAME
