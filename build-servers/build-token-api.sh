#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l token --user root  playbooks/install-python/install-python.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l token --user root  playbooks/install-dependencies/install-dependencies.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l token --user root  playbooks/setup-token-api-services/setup-token-api-services.yml
