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
    docker export $(docker run -d $PACKAGE_NAME /bin/bash) > "/tmp/$IMAGE_NAME.tar"
    docker import "/tmp/$IMAGE_NAME.tar" $PACKAGE_NAME > /dev/null
    echo "Squashed $PACKAGE_NAME"
done
echo "All done!"