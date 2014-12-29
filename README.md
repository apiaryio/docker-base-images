# Apiary's base Docker images

This repository helps to keep Apiary environment, services and libraries consistent and in sync. 

Each directory have area of responsibility and the libraries should derive from the respective image.

As a lot of applications/libraries are deployed on Heroku, images are usually derived from the Ubuntu version from the latest Heroku stack.

## Versioning

We keep `latest` tag for testing and that is updated at-will. Otherwise, semver is used:

* Arch is reserved for OS changes/upgrades (Ubuntu LTS change, ...)
* Major is reserved for packages being added or deleled
* Minor is reserved for package changes

## Usage and maintenance

1. Drill into the respective directory
1. If doing major/arch change, update Dockerfile
1. Build it with the tag expressed below:

	```sh
	$ (sudo) docker build -t "apiaryio/base-$name:$version" .
	```

1. Upload it to DockerHub

	```sh
	$ (sudo) docker push -t "apiaryio/base-$name:$version"
	```

1. When building Apiary app, use the proper `FROM: ` directive inside your `Dockerfile`


## Areas of responsibility

### C++-based programs

* Directory: [cpp](cpp/)
* DockerHub name: `base-cpp`


When written in C++, such as:

* [snowcrash](https://github.com/apiaryio/snowcrash)
