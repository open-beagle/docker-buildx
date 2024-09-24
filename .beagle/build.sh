#!/bin/bash 

set -ex

git config --global --add safe.directory $PWD

mkdir -p dist

export GOARCH=amd64
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH

export GOARCH=arm64
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH

export GOARCH=loong64
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH
