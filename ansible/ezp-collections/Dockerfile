FROM debian:buster
MAINTAINER Arnaud Lafon <arnaud.lafon@gmail.com>

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python python-yaml \
        gcc python-pip python-dev libffi-dev libssl-dev

RUN pip install ansible

RUN ansible-galaxy install cbrunnkvist.ansistrano-symfony-deploy
RUN ansible-galaxy collection install alafon.ezp_toolbox
RUN apt-get update -y && apt-get install openssh-client -y

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
