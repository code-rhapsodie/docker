# Debian image with ansible and basic tools such as make and git
FROM python:3-buster
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN apt-get update && apt-get install -y openssh-client make git && \
	pip install ansible && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
