#!/bin/sh
env DOCKER_BUILDKIT=1 docker build --no-cache -t mc303/otgw --output out .
