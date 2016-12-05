[![Stories in Ready](https://badge.waffle.io/censof/ansible-deployment.png?label=ready&title=Ready)](https://waffle.io/censof/ansible-deployment)
[![Build Status](https://travis-ci.org/censof/ansible-deployment.svg?branch=master)](https://travis-ci.org/censof/ansible-deployment)
# ansible-deployment
Ansible Deployment Scripts for Django

###### Prerequisite

- Ansible 2.0.0.2

- Miniconda (Good to have)

- Both of this can be installed by using the installer script. `pre_install.sh`

###### Supported platform

- RedHat

- Ubuntu

Running ansible script

######Default Script 
**maintain_source(-e "maintain_source=False")**
```

export ECLAIM_BRANCH=${SHIPPABLE_ECLAIM_BRANCH:-staging} && export DEPLOYMENT_URL=git@bitbucket.org:eclaim_revamp_team/eclaim_revamp.git && ansible-playbook -i django_app_server_db_server/deployment/hosts django_app_server_db_server/deployment/main.yml --ask-pass -c paramiko -e 'db_server_ip=localhost'
```

###### With paramaters
**maintain_source(-e "maintain_source=True")**

```
export ECLAIM_BRANCH=${SHIPPABLE_ECLAIM_BRANCH:-staging} && export DEPLOYMENT_URL=git@bitbucket.org:eclaim_revamp_team/eclaim_revamp.git && ansible-playbook -e 'django_app_home=/opt/eclaim_revamp/eclaim app_version=eclaim_revamp db_server_ip=localhost' -i django_app_server_db_server/deployment/hosts django_app_server_db_server/deployment/main.yml **-e "maintain_source=True"** --ask-pass -c paramiko
```

###### Parameters that can be set on the playbook

```
app_version= eclaim_revamp/eclaim
db_server= localhost/dbserver_ip address
maintain_source=True/False
```
`app_version` = What version of eclaims to install new / old

`db_server` = ip address of the db server. Useful when installing in app server / db server setup

`maintain_source` = used mainly for debugging. It short cuts the deletion of the eclaims source so that do not have to spend time 
re-checking out source code (Takes long time)

############## Parameters for email notification

```
`email_host` = email host

`email_host_user` = Client email host user

`email_host_pass` =  Client email host password

`server_email` = Client server mail

`email_port` = Client server mail port number
```

```
to override default setting

`roles:
    - {role: app_server,email_host: smtp.google.com, email_host_user: test, email_host_pass: test, server_email: test@test.com , email_port: 5678 }
`







