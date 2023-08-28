# Docker Gitlab for arm64 / aarch64

A Makefile for building **sameersbn/docker-gitlab** image working for arm64 (aarch64).
The new image is called **m1d1/gitlab** to avoid conflicts. 

For more details about docker GitLab configuration (or docker-compose) see
https://github.com/sameersbn/docker-gitlab

All the work is done by Sameer Naik and contributors.

## Requirements
 - docker, docker-compose, git, make, sed
- **docker-compose.yml** is expected in /srv/docker/gitlab
check Makefile deploy rule

## Usage
- **make all** (build docker image **m1d1/gitlab:latest **)
- **make clean** (required to run before the next **make all**)
- **make new** (alias for: make clean;make all)
- **make deploy** (start docker-compose.yml in /srv/docker/gitlab)
- the provided docker-compose.yml is incomplete
