#!/bin/bash

prox=""

result=`ping -c 1 16.46.16.11 | grep "1 received"`

if [ "$result"!="" ];  then
    prox="--build-arg http_proxy=http://16.46.16.11:8080"
fi


docker build $prox -t opensuse-plain-unsquashed -f docker-files/plain.Dockerfile .
docker build $prox  --squash -t opensuse-plain-squashed -f docker-files/plain.Dockerfile .

docker build $prox -t opensuse-plain+security-unsquashed -f docker-files/plain+security.Dockerfile .
docker build $prox  --squash -t opensuse-plain+security-squashed -f docker-files/plain+security.Dockerfile .

docker build $prox -t opensuse-plain+timezone-unsquashed -f docker-files/plain+timezone.Dockerfile .
docker build $prox  --squash -t opensuse-plain+timezone-squashed -f docker-files/plain+timezone.Dockerfile .

docker build $prox -t opensuse-base-unsquashed -f docker-files/base.Dockerfile .
docker build $prox  --squash -t opensuse-base-squashed -f docker-files/base.Dockerfile .

docker build $prox  -t opensuse-jdk-suse-unsquashed -f docker-files/openjdk-suse.Dockerfile .
docker build $prox  --squash -t opensuse-jdk-suse-squashed -f docker-files/openjdk-suse.Dockerfile .

docker build $prox  -t opensuse-jdk-head-unsquashed -f docker-files/openjdk-head.Dockerfile .
docker build $prox  --squash -t opensuse-jdk-head-squashed -f docker-files/openjdk-head.Dockerfile .

docker build $prox  -t opensuse-jdk-zulu-unsquashed -f docker-files/openjdk-zulu.Dockerfile .
docker build $prox  --squash -t opensuse-jdk-zulu-squashed -f docker-files/openjdk-zulu.Dockerfile .
