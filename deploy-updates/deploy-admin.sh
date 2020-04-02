#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass.txt
ansible-playbook  -i ../hosts/test.hosts -l main --user root  playbooks/update-admin-api/update-admin-api.yml
ansible-playbook  -i ../hosts/test.hosts -l main --user root  playbooks/update-admin-client/update-admin-client.yml
