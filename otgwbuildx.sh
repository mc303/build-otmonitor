#!/bin/sh

DOCKER_TAG=$1
#DOCKER_REPO="ghcr.io/mc303/otmonitor:${DOCKER_TAG}"
DOCKER_REPO=$2
DOCKER_FILE="Dockerfile.otgw"
BUIILDX_REPO='build-otgw'
#BUILD_PLATFORM="linux/amd64,linux/arm64,linux/arm/v7"
BUILD_PLATFORM=$3

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

#create multiplatform environment
docker buildx create --platform=${BUILD_PLATFORM} --name ${BUIILDX_REPO}
docker buildx use ${BUIILDX_REPO}

#build multiplatform docker image
docker buildx build --platform=${BUILD_PLATFORM} -f ${DOCKER_FILE} -t ${DOCKER_REPO}:${DOCKER_TAG} --push .

#remove multiplatform environment
docker buildx rm ${BUIILDX_REPO}
