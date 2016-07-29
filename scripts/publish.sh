#!/usr/bin/env bash

if [ "$DOCKER_EMAIL" != "" ]; then
    docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
fi
docker push $1