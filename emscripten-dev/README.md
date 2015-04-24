# Emscripten dockerized

This image serves as convenient way how to have emscripten at hand
without the need to build it for yourself, which takes a long time as
you need to build clang from source and that's big source code to
build.

## Versioning

The docker image version is the same as emscrpten version so
`apiaryio/base-emscripten-dev:1.31.0` corresponds to emscripten version `1.31.0`.

## Usage

Once `pulled` the usage is simple either invoke simple commands for
interactive use

```sh
$> docker run --rm -v $(pwd):/src -t apiaryio/base-emscripten-dev emconfigure ./configure
```

or if working on non-trivial project have a build script run that, see
the `emcc` direcotry in drafter
[repo](https://github.com/apiaryio/drafter).

```sh
$> docker run --rm -v $(pwd):/src -t apiaryio/base-emscripten-dev emcc/emcbuild.sh
```

Both examples assume you are in the root directory of your project
where is your `configure` or `Makefile`.

