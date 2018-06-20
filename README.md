[![CircleCI](https://circleci.com/gh/apiaryio/docker-base-images.svg?style=svg)](https://circleci.com/gh/apiaryio/docker-base-images)

# Apiary Docker images

This repository helps keep Apiary environment, services and libraries consistent and in sync.

Each directory has an area of responsibility and the libraries should derive from the respective image.

To keep the image size to its minimum, images are usually derived from minimal Debian image (apiaryio/debian-minimal)
or Alpine Linux.

Libraries use the minimal stack available.

Some of the images use tags to differentiate between versions of an underlying library/system, such as apiaryio/coreapp
image might be built on different Node.js versions. If this is the case, each tag has a separate Dockerfile in a folder
with a tag name:

```
     ./coreapp
     ./coreapp/0.10/Dockerfile
     ./coreapp/0.12/Dockerfile
```

## Usage and maintenance

1. Drill into the respective directory
1. If doing major/arch change, update `REFRESHED_AT` in the Dockerfile
1. Build the Docker image with the tag expressed below:

    ```sh
    $ (sudo) docker build -t "apiaryio/$name:$tag" .
    ```

1. Upload it to DockerHub

    ```sh
    $ (sudo) docker push -t "apiaryio/$name:$tag"
    ```

1. When building Apiary app, use the proper `FROM:` directive inside your `Dockerfile`

## Adding a new image

1. Create a repository in DockerHub and set Collaborators to SRE with writing rights.
1. Add a folder with the image name to this repository structure
1. If multiple versions are needed, add subfolders with the tag names to the image folder
1. Add your Dockerfile(s)

Images are built automatically on CircleCI. Builds on `master` branch include a deploy step with pushing the built
images to DockerHub. If you add a new image as described above, your image will get built and pushed automatically once
the changes are merged.
