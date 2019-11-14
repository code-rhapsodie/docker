FROM python:3-buster
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN pip install ansible

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
