#!/bin/sh

for directory in *; do
    if [ -d "${directory}" ]; then
        docker build "${directory}" -t ansible:"${directory}"
        docker tag ansible:"${directory}" docker.pkg.github.com/code-rhapsodie/docker-ansible/ansible:"${directory}"
        docker push docker.pkg.github.com/code-rhapsodie/docker-ansible/ansible:"${directory}"
    fi
done

for directory in *; do
    if [ -d "${directory}" ]; then
        docker rmi ansible:"${directory}"
    fi
done

docker images