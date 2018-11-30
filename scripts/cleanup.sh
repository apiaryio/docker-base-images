#!/bin/bash

echo "Running docker container prune -f..."
docker container prune -f || true

for IMAGE in $(cat /tmp/images); do
    echo "Removing ${IMAGE}"
    docker rmi $IMAGE || true
done

echo "Running docker volume prune -f..."
docker volume prune -f || true
