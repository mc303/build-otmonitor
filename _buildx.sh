#!/bin/sh

DOCKER_REPO="mc303/otgw"
DOCKER_FILE="Dockerfile.aarch64"
BUIILDX_REPO='build-otmonitor'
BUILD_PLATFORM="linux/arm64"
OTGW_VERSION=$1

# BUILD_PLATFORM="linux/386,linux/amd64,linux/arm/v7,linux/arm64/v8"

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

#create multiplatform environment
docker buildx create --platform=${BUILD_PLATFORM} --name ${BUIILDX_REPO}
docker buildx use ${BUIILDX_REPO}

#build multiplatform docker image
docker buildx build --platform=${BUILD_PLATFORM} -f ${DOCKER_FILE} -t ${DOCKER_REPO} -o out --build-arg VERSION=${OTGW_VERSION} .

#remove multiplatform environment
docker buildx rm ${BUIILDX_REPO}

## =================================================

DOCKER_FILE="Dockerfile.x64"
BUILD_PLATFORM="linux/amd64"

# BUILD_PLATFORM="linux/386,linux/amd64,linux/arm/v7,linux/arm64/v8"

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

#create multiplatform environment
docker buildx create --platform=${BUILD_PLATFORM} --name ${BUIILDX_REPO}
docker buildx use ${BUIILDX_REPO}

#build multiplatform docker image
docker buildx build --platform=${BUILD_PLATFORM} -f ${DOCKER_FILE} -t ${DOCKER_REPO} -o out --build-arg VERSION=${OTGW_VERSION} .

#remove multiplatform environment
docker buildx rm ${BUIILDX_REPO}

## ================================================

DOCKER_FILE="Dockerfile.ahf"
BUILD_PLATFORM="linux/arm/v7"

# BUILD_PLATFORM="linux/386,linux/amd64,linux/arm/v7,linux/arm64/v8"

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

#create multiplatform environment
docker buildx create --platform=${BUILD_PLATFORM} --name ${BUIILDX_REPO}
docker buildx use ${BUIILDX_REPO}

#build multiplatform docker image
docker buildx build --platform=${BUILD_PLATFORM} -f ${DOCKER_FILE} -t ${DOCKER_REPO} -o out --build-arg VERSION=${OTGW_VERSION} .

#remove multiplatform environment
docker buildx rm ${BUIILDX_REPO}

## ================================================

