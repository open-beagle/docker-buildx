# docker-buildx

https://github.com/docker/buildx

```bash
git remote add upstream git@github.com:docker/buildx.git

git fetch upstream

git merge v0.20.1
```

## build

```bash
# loong64
docker run -it \
--rm \
-v $PWD/:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
-e VERSION=v0.20.1-beagle \
-e PLATFORM="Beagle Cloud Team 2023-2028" \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.23-loongnix \
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

# ppc64le
docker run -it --rm \
-v $PWD/:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
registry.cn-qingdao.aliyuncs.com/wod/alpine:3-ppc64le \
sh -c "build/docker-linux-ppc64le version"

# mips64le
docker run -it --rm \
-v $PWD/:/go/src/github.com/docker/buildx \
-w /go/src/github.com/docker/buildx \
registry.cn-qingdao.aliyuncs.com/wod/alpine:3-mips64le \
sh -c "build/docker-linux-mips64le version"
```

## cache

```bash
# 构建缓存-->推送缓存至服务器
docker run --rm \
  -e PLUGIN_REBUILD=true \
  -e PLUGIN_ENDPOINT=$S3_ENDPOINT_ALIYUN \
  -e PLUGIN_ACCESS_KEY=$S3_ACCESS_KEY_ALIYUN \
  -e PLUGIN_SECRET_KEY=$S3_SECRET_KEY_ALIYUN \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="docker-buildx" \
  -e PLUGIN_MOUNT="./.git" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0

# 读取缓存-->将缓存从服务器拉取到本地
docker run --rm \
  -e PLUGIN_RESTORE=true \
  -e PLUGIN_ENDPOINT=$S3_ENDPOINT_ALIYUN \
  -e PLUGIN_ACCESS_KEY=$S3_ACCESS_KEY_ALIYUN \
  -e PLUGIN_SECRET_KEY=$S3_SECRET_KEY_ALIYUN \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="docker-buildx" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0
```
