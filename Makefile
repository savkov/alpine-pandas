.PHONY: all test clean build
NAME=alpine-pandas
VERSION=$(shell git rev-parse HEAD)
SEMVER_VERSION=$(shell git describe --abbrev=0 --tags)
REPO=quay.io/savkov

login:
	docker login -u ${DOCKER_LOGIN} -p ${DOCKER_PASSWORD} quay.io

build:
	docker build -t $(REPO)/$(NAME):$(VERSION) .

tag-latest:
	docker tag $(REPO)/$(NAME):$(VERSION) $(REPO)/$(NAME):latest

tag-semver:
	docker tag $(REPO)/$(NAME):$(VERSION) $(REPO)/$(NAME):$(SEMVER_VERSION); \
	docker tag $(REPO)/$(NAME):$(VERSION) $(REPO)/$(NAME):latest

push:
	docker push $(REPO)/$(NAME):$(VERSION); \
	docker push $(REPO)/$(NAME):latest
