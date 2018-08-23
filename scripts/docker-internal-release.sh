#!/bin/bash

if [ -z "$IMAGES" ]; then
    if [ -e /tmp/images ]; then
        IMAGES=`cat /tmp/images`
    fi
    if [ -z "$IMAGES" ]; then
        echo "No IMAGES set, skipping the internal release"
        exit 0
    fi
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
    exitOnError "DockerHub credentials are missing (DOCKER_EMAIL, DOCKER_USER, DOCKER_PASS), cannot proceed."
fi

CREDENTIALS_FILE=~/.docker/config.json
if [[ -e $CREDENTIALS_FILE && ! -w $CREDENTIALS_FILE ]]; then
    exitOnError "Found $CREDENTIALS_FILE but it's not writable, cannot proceed."
fi

echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
exitOnError "docker login"

for IMAGE_NAME in $IMAGES
do
    echo "Preparing to push $IMAGE_NAME..."
    echo "Pushing $IMAGE_NAME..."
    docker push $IMAGE_NAME
    exitOnError "pushing $IMAGE_NAME"
    echo "$IMAGE_NAME pushed successfully"
done
echo "All done!"
