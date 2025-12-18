# Debian image with ansible and basic tools such as make and git
FROM python:3-trixie
LABEL org.opencontainers.image.authors="Jean-Baptiste N. <jean-baptiste@code-rhapsodie.fr>"

RUN apt-get update && apt-get install -y openssh-client make git rsync && \
	pip install ansible && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
