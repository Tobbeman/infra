#!/bin/bash

set -e
set -o nounset

dockertag=infra-ansible
dockerfile=Dockerfile
dockerflag=.Dockerfile.flag
build=0

# Check if we need to build a new image
if ! docker images | grep -q "$dockertag"; then
	echo "no image cached"
	build=1
fi

if [ -f "$dockerflag" ]; then
	if [ "$(stat -c %Y $dockerfile)" -gt "$(stat -c %Y $dockerflag)" ]; then
		echo "$dockerfile has changed since last build"
		build=1
	fi
else
	echo "$dockerflag does not exist"
	build=1
fi

if [ "$build" -eq 1 ]; then
	docker build . -f $dockerfile -t $dockertag
	touch "$dockerflag"
fi

# Run ansible
docker run -ti -v ~/.ssh:/home/ansible/.ssh -v "$(pwd)":/home/ansible/infra "$dockertag" "$@"
