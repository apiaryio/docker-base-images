# Dredd in Docker (apiaryio/dredd)

Available at [Docker Hub](https://hub.docker.com/r/apiaryio/dredd/). For further information on Dredd, see [the documentation](http://dredd.org/en/latest/).

## Running Dredd in Docker

To initialize the Dredd configuration:

1. make sure you have your API description document ready
1. navigate to the folder with your ADD and run:

```
docker run -it -v $PWD:/api -w /api apiaryio/dredd dredd init
```

After completing the configuration wizard, a `dredd.yml` will appear in the current folder (on your host).

To run Dredd tests, run:

```
docker run -it -v $PWD:/api -w /api apiaryio/dredd
```
