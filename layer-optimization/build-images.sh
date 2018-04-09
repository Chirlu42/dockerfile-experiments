#!/bin/bash

docker build --build-arg http_proxy=http://16.46.16.11:8080 -t opensuse-plain-unsquashed -f docker-files/plain.Dockerfile .
docker build --build-arg http_proxy=http://16.46.16.11:8080 --squash -t opensuse-plain-squashed -f docker-files/plain.Dockerfile .

#docker build --build-arg http_proxy=http://16.46.16.11:8080 -t opensuse-jdk-suse-unsquashed -f docker-files/openjdk-suse.Dockerfile .
#docker build --build-arg http_proxy=http://16.46.16.11:8080 --squash -t opensuse-jdk-suse-squashed -f docker-files/openjdk-suse.Dockerfile .

#docker build --build-arg http_proxy=http://16.46.16.11:8080 -t opensuse-jdk-head-unsquashed -f docker-files/openjdk-head.Dockerfile .
#docker build --build-arg http_proxy=http://16.46.16.11:8080 --squash -t opensuse-jdk-head-squashed -f docker-files/openjdk-head.Dockerfile .

#docker build --build-arg http_proxy=http://16.46.16.11:8080 -t opensuse-jdk-zulu-unsquashed -f docker-files/openjdk-zulu.Dockerfile .
#docker build --build-arg http_proxy=http://16.46.16.11:8080 --squash -t opensuse-jdk-zulu-squashed -f docker-files/openjdk-zulu.Dockerfile .
