FROM python:3-buster
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN pip install ansible

# Required so the Ansible container can take and manage SSH keys
RUN apt-get install openssh-client -y

RUN ansible-galaxy install cbrunnkvist.ansistrano-symfony-deploy
RUN ansible-galaxy collection install alafon.ezp_toolbox

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
