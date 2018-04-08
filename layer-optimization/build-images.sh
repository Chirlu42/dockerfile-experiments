#!/bin/bash

docker build -t opensuse-plain-unsquashed -f docker-files/Dockerfile.plain .
docker build --squash -t opensuse-plain-squashed -f docker-files/Dockerfile.plain .

docker build -t opensuse-jdk-suse-unsquashed -f docker-files/Dockerfile.openjdk-suse .
docker build --squash -t opensuse-jdk-suse-squashed -f docker-files/Dockerfile.openjdk-suse .

docker build -t opensuse-jdk-head-unsquashed -f docker-files/Dockerfile.openjdk-head .
docker build --squash -t opensuse-jdk-head-squashed -f docker-files/Dockerfile.openjdk-head .

docker build -t opensuse-jdk-zulu-unsquashed -f docker-files/Dockerfile.openjdk-zulu .
docker build --squash -t opensuse-jd-zulu-squashed -f docker-files/Dockerfile.openjdk-zulu .
