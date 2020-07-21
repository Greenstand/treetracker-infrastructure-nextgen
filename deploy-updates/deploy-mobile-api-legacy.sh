#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l main --user root  playbooks/update-mobile-api-legacy/update-mobile-api-legacy.yml
