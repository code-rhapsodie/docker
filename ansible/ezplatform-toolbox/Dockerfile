FROM python:3-buster
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN pip install ansible

RUN ansible-galaxy install cbrunnkvist.ansistrano-symfony-deploy
RUN ansible-galaxy collection install alafon.ezp_toolbox

# Required so the Ansible container can take and manage SSH keys
RUN apt-get update && apt-get install openssh-client -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
