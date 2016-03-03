#!/bin/bash
if [ -z "$IMAGES_TO_SQUASH" ]; then
    echo "No IMAGES_TO_SQUASH set, skipping the internal release"
    exit 1
fi

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

if [[ -e $CREDENTIALS_FILE ]]; then
    if ! grep -q "index.docker.io" "$CREDENTIALS_FILE"; then
        echo "Docker login failed, cannot proceed."
        exit 1
    fi
fi

for IMAGE_NAME in $IMAGES_TO_SQUASH
do
    echo "Preparing to push $IMAGE_NAME..."
    PACKAGE_NAME="apiaryio/base-dev-$IMAGE_NAME"
    echo "Pushing $PACKAGE_NAME..."
    docker push $PACKAGE_NAME
    echo "$PACKAGE_NAME pushed successfully"
done
echo "All done!"
