#!/usr/bin/env bash

MODE="$1"
IMAGE="$2"
VERSION="$3"

cd image
jenkins_version=$(awk '/FROM jenkins\/jenkins/ {print $2}' Dockerfile | cut -d: -f2 | cut -d- -f1)
tag="$jenkins_version-$VERSION"

if [ "$MODE" = 'build' ]; then
    echo -e "\nBuilding $IMAGE:$tag..."
    docker pull $IMAGE:$tag || true
    docker build --pull --cache-from $IMAGE:$tag -t $IMAGE:$tag .
fi
if [ "$MODE" = "deploy" ]; then
    echo -e '\nDeploying...'
    docker push $IMAGE:$tag
fi
