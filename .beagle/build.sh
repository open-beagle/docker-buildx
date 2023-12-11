#!/bin/bash 

set -ex

export GOARCH=amd64
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH

export GOARCH=arm64
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH

export GOARCH=ppc64le
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH

export GOARCH=mips64le
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH

export GOARCH=loong64
bash hack/build
mv bin/build/docker-buildx bin/build/docker-buildx-linux-$GOARCH
