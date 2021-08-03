FROM docker:20.10.7-dind
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN apk add --no-cache --update \
	py-pip \
	python3-dev \
	libffi-dev \
	openssl-dev \
	gcc \
	libc-dev \
	make \
	git \
	musl-dev \
	cargo
RUN pip install --upgrade pip
RUN pip install docker-compose
