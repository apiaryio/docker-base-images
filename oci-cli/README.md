# apiaryio/oci-cli

Docker image for [OCI CLI](https://github.com/oracle/oci-cli) built on Oracle Linux

## Setup

These steps will result in having OCI CLI configuration files in your home directory (`~/.oci`):

1. Run ```docker run -it -v ~/:/home/oci apiaryio/oci-cli setup config```
1. Fill out the requested data

> Note: If OCI CLI generated a key-pair, upload the public part in the OCI console as described [here]     (https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm#How2).

## Usage

Given the OCI CLI is configured already and the configuration files are in `~/.oci`, run:

```
    docker run -it -v ~/:/home/oci apiaryio/oci-cli <oci-cli command>
```

> Tip: define a function in your bash profile to have a single command handy:

```
    oci() {
        docker run -it -v ~/:/home/oci apiaryio/oci-cli "$@"
    }
```
