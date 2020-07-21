#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/update-web-map-api/update-web-map-api.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/update-web-map-client/update-web-map-client.yml
