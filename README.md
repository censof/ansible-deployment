[![Stories in Ready](https://badge.waffle.io/censof/ansible-deployment.png?label=ready&title=Ready)](https://waffle.io/censof/ansible-deployment)
[![Build Status](https://travis-ci.org/censof/ansible-deployment.svg?branch=master)](https://travis-ci.org/censof/ansible-deployment)
# ansible-deployment
Ansible Deployment Scripts for Django


Running ansible script

######Default Script maintain_source(-e "maintain_source=False")

export ECLAIM_BRANCH=${SHIPPABLE_ECLAIM_BRANCH:-staging} && export DEPLOYMENT_URL=git@bitbucket.org:eclaim_revamp_team/eclaim_revamp.git && time ansible-playbook -e 'django_app_home=/opt/eclaim_revamp/eclaim app_version=eclaim_revamp' -i django_app_server_db_server/deployment/hosts django_app_server_db_server/deployment/main.yml --ask-pass -c paramiko -e 'db_server_ip=localhost'

######with paramater maintain_source(-e "maintain_source=True")

export ECLAIM_BRANCH=${SHIPPABLE_ECLAIM_BRANCH:-staging} && export DEPLOYMENT_URL=git@bitbucket.org:eclaim_revamp_team/eclaim_revamp.git && time ansible-playbook -e 'django_app_home=/opt/eclaim_revamp/eclaim app_version=eclaim_revamp' -i django_app_server_db_server/deployment/hosts django_app_server_db_server/deployment/main.yml -e **"maintain_source=True"** --ask-pass -c paramiko -e 'db_server_ip=localhost'




