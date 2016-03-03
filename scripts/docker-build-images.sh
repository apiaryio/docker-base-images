#!/bin/bash
if [ -z "$IMAGES_TO_SQUASH" ]; then
    echo "No IMAGES_TO_SQUASH set, skipping the internal build"
    exit 1
fi

for IMAGE_NAME in $IMAGES_TO_SQUASH
do
    LOCATION="./$IMAGE_NAME-dev"
    DOCKERFILE="$LOCATION/Dockerfile"
    PACKAGE_NAME="apiaryio/base-dev-$IMAGE_NAME"
    echo "Building $PACKAGE_NAME based on $DOCKERFILE"
    docker build -t $PACKAGE_NAME -f $DOCKERFILE $LOCATION
    echo "Squashing $PACKAGE_NAME..."
    docker save $PACKAGE_NAME > "/tmp/$IMAGE_NAME.tar"
    sudo docker-squash -i "/tmp/$IMAGE_NAME.tar" -o "/tmp/$IMAGE_NAME-squashed.tar"
    cat "/tmp/$IMAGE_NAME-squashed.tar" | docker load
    echo "Squashed $PACKAGE_NAME"
done
echo "All done!"
