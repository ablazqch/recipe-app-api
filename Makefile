#!/usr/bin/make -f

PROJECT_NAME := 'Recipie app API'

.PHONY: test linting check-types build

DELIVERY_ROOT_FOLDER := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DOCKER_COMPOSE_FILE := $(DELIVERY_ROOT_FOLDER)/docker-compose.yml
DOCKER_PROJECT_NAME := recipie-project
DOCKER_COMMAND := docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE)

shell:
	$(DOCKER_COMMAND) exec app /bin/sh
build:
	$(DOCKER_COMMAND) build
env-start:
	$(DOCKER_COMMAND) up --detach
