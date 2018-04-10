#!/bin/bash

prox=""

result=`ping -c 1 16.46.16.11 | grep "1 received"`

if [ "$result"!="" ];  then
    prox="--build-arg http_proxy=http://16.46.16.11:8080"
fi


docker build $prox -t opensuse-1-plain-unsquashed -f docker-files/plain.Dockerfile .
docker build $prox  --squash -t opensuse-1-plain-squashed -f docker-files/plain.Dockerfile .

docker build $prox -t opensuse-2-plain-security-unsquashed -f docker-files/plain+security.Dockerfile .
docker build $prox  --squash -t opensuse-2-plain-security-squashed -f docker-files/plain+security.Dockerfile .

docker build $prox -t opensuse-3-plain-timezone-unsquashed -f docker-files/plain+timezone.Dockerfile .
docker build $prox  --squash -t opensuse-3-plain-timezone-squashed -f docker-files/plain+timezone.Dockerfile .

docker build $prox -t opensuse-4-base-unsquashed -f docker-files/base.Dockerfile .
docker build $prox  --squash -t opensuse-4-base-squashed -f docker-files/base.Dockerfile .

docker build $prox  -t opensuse-6-jdk-suse-unsquashed -f docker-files/openjdk-suse.Dockerfile .
docker build $prox  --squash -t opensuse-6-jdk-suse-squashed -f docker-files/openjdk-suse.Dockerfile .

docker build $prox  -t opensuse-5-jdk-head-unsquashed -f docker-files/openjdk-head.Dockerfile .
docker build $prox  --squash -t opensuse-5-jdk-head-squashed -f docker-files/openjdk-head.Dockerfile .

docker build $prox  -t opensuse-7-jdk-zulu-unsquashed -f docker-files/openjdk-zulu.Dockerfile .
docker build $prox  --squash -t opensuse-7-jdk-zulu-squashed -f docker-files/openjdk-zulu.Dockerfile .
