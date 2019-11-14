FROM debian:buster
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python python-yaml \
        gcc python-pip python-dev libffi-dev libssl-dev

RUN pip install ansible

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*  /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
