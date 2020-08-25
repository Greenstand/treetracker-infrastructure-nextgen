#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

if [ "$ENV" = "prod" ]
then
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass_prod.txt
else
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass.txt
fi

ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/update-web-map-api/update-web-map-api.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/update-web-map-client/update-web-map-client.yml
