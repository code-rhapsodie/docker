TODO: move to github actions and update documentation

# Docker images

![CI status](https://github.com/code-rhapsodie/docker/actions/workflows/docker.yml/badge.svg)

This repository holds reusable images we need to build or extend very often.

List of available images: https://github.com/code-rhapsodie/docker/packages

## Usage

```
docker pull docker.pkg.github.com/code-rhapsodie/docker/<IMAGE>:<VERSION>
```

or 

https://hub.docker.com/repository/docker/coderhapsodie/docker

```
docker pull coderhapsodie/docker:<IMAGE>-<VERSION>
```

## Add new image

1) create a folder `myimage`
2) create a subfolder for the version `version`
3) create a `Dockerfile` in `myimage/version`
4) add the `myimage`/`version` tuple as a new entry in the env/matrix in `.travis.yml`

## How it works

1) travis build the image
2) travis push the image with a deployment step

It uses encrypted credentials tied to this project and pushed with:

```
$ travis encrypt GITHUB_USERNAME=XXXX --add env.global
$ travis encrypt GITHUB_PASSWORD=XXXX --add env.global
```

## Contribute

Documentation: when modifying the documention please add `[ci skip]` in the commit message.

## Todo

- make it possible to reuse one of the existing built image during the same build
