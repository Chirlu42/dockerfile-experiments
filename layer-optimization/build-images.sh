#!/bin/bash

prox=""

result=`ping -c 1 16.46.16.11 | grep "1 received"`

if [ $result!="" ];
    then
        prox="http://16.46.16.11:8080"
fi


docker build --build-arg http_proxy=$prox -t opensuse-plain-unsquashed -f docker-files/plain.Dockerfile .
docker build --build-arg http_proxy=$prox  --squash -t opensuse-plain-squashed -f docker-files/plain.Dockerfile .

docker build --build-arg http_proxy=$prox  -t opensuse-jdk-suse-unsquashed -f docker-files/openjdk-suse.Dockerfile .
docker build --build-arg http_proxy=$prox  --squash -t opensuse-jdk-suse-squashed -f docker-files/openjdk-suse.Dockerfile .

#docker build --build-arg http_proxy=$prox  -t opensuse-jdk-head-unsquashed -f docker-files/openjdk-head.Dockerfile .
#docker build --build-arg http_proxy=$prox  --squash -t opensuse-jdk-head-squashed -f docker-files/openjdk-head.Dockerfile .

#docker build --build-arg http_proxy=$prox  -t opensuse-jdk-zulu-unsquashed -f docker-files/openjdk-zulu.Dockerfile .
#docker build --build-arg http_proxy=$prox  --squash -t opensuse-jdk-zulu-squashed -f docker-files/openjdk-zulu.Dockerfile .
