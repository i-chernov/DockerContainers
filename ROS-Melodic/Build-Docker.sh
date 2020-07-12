#!/bin/bash

IMAGE_NAME="ros-melodic"

BUILD_ARGS="--build-arg USER_NAME=ros"
BUILD_ARGS+=" --build-arg USER_PASSWORD=ros"
BUILD_ARGS+=" --build-arg USER_ID=1000"
BUILD_ARGS+=" --build-arg USER_GID=1000"

docker build ${BUILD_ARGS} --tag ${IMAGE_NAME} .