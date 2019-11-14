#!/bin/bash

docker tag $IMAGE:$VERSION docker.pkg.github.com/code-rhapsodie/docker/$IMAGE:$VERSION
echo "$GITHUB_PASSWORD" | docker login docker.pkg.github.com -u "$GITHUB_USERNAME" --password-stdin
docker push docker.pkg.github.com/code-rhapsodie/docker/$IMAGE:$VERSION
