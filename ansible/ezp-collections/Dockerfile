FROM docker.pkg.github.com/code-rhapsodie/docker-ansible/ansible:debian-buster

RUN ansible-galaxy install cbrunnkvist.ansistrano-symfony-deploy
RUN ansible-galaxy collection install alafon.ezp_toolbox
RUN apt-get update -y && apt-get install openssh-client -y
