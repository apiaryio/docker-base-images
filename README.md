[![CircleCI](https://circleci.com/gh/apiaryio/docker-base-images.svg?style=svg)](https://circleci.com/gh/apiaryio/docker-base-images)

# Apiary Docker images

This repository helps keep Apiary environment, services and libraries consistent and in sync. 

Each directory has an area of responsibility and the libraries should derive from the respective image.

To keep the image size to its minimum, images are usually derived from minimal Debian image (apiaryio/debian-minimal) 
or Alpine Linux.

Libraries use the minimal stack available.

## Usage and maintenance

1. Drill into the respective directory
1. If doing major/arch change, update `REFRESHED_AT` in the Dockerfile
1. Build the Docker image with the tag expressed below:

    ```sh
    $ (sudo) docker build -t "apiaryio/$name:$version" .
    ```

1. Upload it to DockerHub

    ```sh
    $ (sudo) docker push -t "apiaryio/$name:$version"
    ```

1. When building Apiary app, use the proper `FROM:` directive inside your `Dockerfile`
