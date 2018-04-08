#!/bin/bash

docker build -t opensuse-plain-unsquashed -f docker-files/Dockerfile.plain .
docker build --squash -t opensuse-plain-squashed -f docker-files/Dockerfile.plain .
