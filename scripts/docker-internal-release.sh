#!/bin/bash
if [ -z "$IMAGES_TO_SQUASH" ]; then
    echo "No IMAGES_TO_SQUASH set, skipping the internal release"
    exit 1
fi

function exitOnError {
  EXIT_CODE=$?
  if [ $EXIT_CODE -ne 0 ]; then
    echo "$1 failed with code $EXIT_CODE"
    exit $EXIT_CODE
  fi
}

echo "Authenticating with Docker Hub..."
if [[ -z "$DOCKER_EMAIL" || -z "$DOCKER_USER" || -z "$DOCKER_PASS" ]]; then
    echo "DockerHub credentials are missing (DOCKER_EMAIL, DOCKER_USER, DOCKER_PASS), cannot proceed."
    exit 1
fi

CREDENTIALS_FILE=~/.docker/config.json
if [[ -e $CREDENTIALS_FILE && ! -w $CREDENTIALS_FILE ]]; then
    echo "Found $CREDENTIALS_FILE but it's not writable, cannot proceed."
    exit 1
fi

docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
exitOnError "docker login"

for IMAGE_NAME in $IMAGES_TO_SQUASH
do
    echo "Preparing to push $IMAGE_NAME..."
    PACKAGE_NAME="apiaryio/base-dev-$IMAGE_NAME"
    docker tag -f $PACKAGE_NAME $PACKAGE_NAME:latest
    echo "Pushing $PACKAGE_NAME..."
    docker push $PACKAGE_NAME:latest
    exitOnError "pushing $PACKAGE_NAME"
    echo "$PACKAGE_NAME:latest pushed successfully"
done
echo "All done!"
