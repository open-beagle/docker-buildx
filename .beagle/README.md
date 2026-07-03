# docker-buildx

https://github.com/docker/buildx

```bash
git -C ansible-docker-buildx remote add upstream git@github.com:docker/buildx.git

git -C ansible-docker-buildx fetch upstream

git -C ansible-docker-buildx merge v0.34.0
```

## build

```bash
# loong64
docker run -it \
--rm \
-v $PWD/ansible-docker-buildx:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
-e VERSION=v0.34.0-beagle \
-e PLATFORM="Beagle Cloud Team 2023-2028" \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.23-loongnix \
bash .beagle/build.sh

# amd64&arm64
docker run -it \
--rm \
-v $PWD/ansible-docker-buildx:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
-e VERSION=v0.34.0-beagle \
-e PLATFORM="Beagle Cloud Team 2023-2028" \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.26-alpine \
bash .beagle/build.sh
```

## test

```bash
# amd64
docker run -it --rm \
-v $PWD/:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
registry.cn-qingdao.aliyuncs.com/wod/alpine:3-amd64 \
sh -c "build/docker-linux-amd64 version"

# arm64
docker run -it --rm \
-v $PWD/:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
registry.cn-qingdao.aliyuncs.com/wod/alpine:3-arm64 \
sh -c "build/docker-linux-arm64 version"
```
