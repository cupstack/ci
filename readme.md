# ci

setup docker images for ci.

## Instructions

Invoking make with the following command will build the docker images.
Arguments in square bracket are optional. The following command will build a
docker image and will push it to `$DOCKER_USER` registry.

```
make \
  [NO_CACHE="--no-cache"] \
  DOCKER_USER=$DOCKER_USER \
  DISTRIBUTION=$DISTRIBUTION \
  RELEASE=$RELEASE \
  $DISTRIBUTION:$RELEASE
```


## CI Instructions
This repository is configured to use the Gitlab CI for generating docker
images. It needs a executor tagged `shell` wherein the underlying shell should
already have access to the `$DOCKER_USER`. The CI scripts require following
variables to be set:

- `DOCKER_USER` : User to which the docker container is to be pushed to.

The following variables are optional

- `NO_CACHE` : Set to `--no-cache` for uncached docker builds.
