REGISTRY_REPO=fl64
CONTAINER_NAME=nginx_test
CONTAINER_VER=$(shell git describe --tags)

CONTAINER_NAME_TAG=$(REGISTRY_REPO)/$(CONTAINER_NAME):$(CONTAINER_VER)
CONTAINER_NAME_LATEST=$(REGISTRY_REPO)/$(CONTAINER_NAME):latest

build:
	docker build -t $(CONTAINER_NAME_TAG) .

latest: build
	docker tag $(CONTAINER_NAME_TAG) $(CONTAINER_NAME_LATEST)

push: build
	docker push $(CONTAINER_NAME_TAG)

push_latest: latest
	docker push $(CONTAINER_NAME_LATEST)
