SHELL := /bin/bash

dockerfile_array = $(wildcard share/docker/*)
dockerfile_basename_array = $(patsubst %.dockerfile,%, $(dockerfile_array))
image_array := $(patsubst share/docker/%,%,$(dockerfile_basename_array))

$(image_array) : $@
	docker build \
		$(NO_CACHE) \
		--pull \
		--network=host \
		-t $(DOCKER_USER)/$(DISTRIBUTION):$(RELEASE) \
		-f share/docker/$@.dockerfile \
		.

	docker tag  \
		$(DOCKER_USER)/$(DISTRIBUTION):$(RELEASE) \
		$(DOCKER_USER)/$(DISTRIBUTION):$(RELEASE)

	docker push \
		$(DOCKER_USER)/$(DISTRIBUTION):$(RELEASE)


