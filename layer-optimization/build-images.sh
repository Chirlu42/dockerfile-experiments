#!/bin/bash

docker build -t opensuse-plain-unsquashed -f docker-files/Dplain.Dockerfile .
docker build --squash -t opensuse-plain-squashed -f docker-files/Dplain.Dockerfile .

docker build -t opensuse-jdk-suse-unsquashed -f docker-files/openjdk-suse.Dockerfile .
docker build --squash -t opensuse-jdk-suse-squashed -f docker-files/openjdk-suse.Dockerfile .

docker build -t opensuse-jdk-head-unsquashed -f docker-files/openjdk-head.Dockerfile .
docker build --squash -t opensuse-jdk-head-squashed -f docker-files/openjdk-head.Dockerfile .

docker build -t opensuse-jdk-zulu-unsquashed -f docker-files/openjdk-zulu.Dockerfile .
docker build --squash -t opensuse-jd-zulu-squashed -f docker-files/openjdk-zulu.Dockerfile .
