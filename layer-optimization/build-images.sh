#!/bin/bash

prox=""

#
# Check if the host is directly connected to the internet or via corporate web-proxy
#

if ping -c 1 16.46.16.11; then
    prox="--build-arg http_proxy=http://16.46.16.11:8080"
else
    prox = ""
fi

#
# Run all docker builds in sequence
#

#: <<'end_long_comment'

##

echo "build $prox -t opensuse-1a-plain-no-update-unsquashed -f docker-files/plain-no-update.Dockerfile ."

docker build $prox -t opensuse-1a-plain-no-update-unsquashed -f docker-files/plain-no-update.Dockerfile .
docker build $prox --squash -t opensuse-1a-plain-no-update-squashed -f docker-files/plain-no-update.Dockerfile .

##

echo "build $prox -t opensuse-1a-plain-no-a-unsquashed -f docker-files/plain.Dockerfile ."

docker build $prox -t opensuse-1a-plain-no-a-unsquashed -f docker-files/plain.Dockerfile .
docker build $prox  --squash -t opensuse-1a-plain-no-a-squashed -f docker-files/plain.Dockerfile .

##

docker build $prox -t opensuse-1b-plain-with-a-unsquashed -f docker-files/plain+a.Dockerfile .
docker build $prox  --squash -t opensuse-1b-plain-with-a-squashed -f docker-files/plain+a.Dockerfile .

##

docker build $prox -t opensuse-2-plain-security-unsquashed -f docker-files/plain+security.Dockerfile .
docker build $prox  --squash -t opensuse-2-plain-security-squashed -f docker-files/plain+security.Dockerfile .

##

docker build $prox -t opensuse-3-plain-timezone-unsquashed -f docker-files/plain+timezone.Dockerfile .
docker build $prox  --squash -t opensuse-3-plain-timezone-squashed -f docker-files/plain+timezone.Dockerfile .

docker build $prox -t opensuse-4-base-unsquashed -f docker-files/base.Dockerfile .
docker build $prox  --squash -t opensuse-4-base-squashed -f docker-files/base.Dockerfile .

docker build $prox  -t opensuse-6-jdk-suse-unsquashed -f docker-files/openjdk-suse.Dockerfile .
docker build $prox  --squash -t opensuse-6-jdk-suse-squashed -f docker-files/openjdk-suse.Dockerfile .

docker build $prox  -t opensuse-5-jdk-head-unsquashed -f docker-files/openjdk-head.Dockerfile .
docker build $prox  --squash -t opensuse-5-jdk-head-squashed -f docker-files/openjdk-head.Dockerfile .

docker build $prox  -t opensuse-7-jdk-zulu-rpm-unsquashed -f docker-files/openjdk-zulu-rpm.Dockerfile .
docker build $prox  --squash -t opensuse-7-jdk-zulu-rpm-squashed -f docker-files/openjdk-zulu-rpm.Dockerfile .

docker build $prox  -t opensuse-8-jdk-zulu-zyp-unsquashed -f docker-files/openjdk-zulu-zyp.Dockerfile .
docker build $prox  --squash -t opensuse-8-jdk-zulu-zyp-squashed -f docker-files/openjdk-zulu-zyp.Dockerfile .

#end_long_comment
