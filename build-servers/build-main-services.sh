#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/install-ssh-key/install-ssh-key.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/install-python/install-python.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/install-dependencies/install-dependencies.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/setup-map-api-service/setup-map-api-service.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/setup-admin-api-service/setup-admin-api-service.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/install-nginx/install-nginx.yml
