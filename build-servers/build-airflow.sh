#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l airflow --user root  playbooks/install-ssh-key/install-ssh-key.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l airflow --user root  playbooks/install-python/install-python.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l airflow --user root  playbooks/update-upgrade-ubuntu/update-upgrade-ubuntu.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l airflow --user root  playbooks/install-airflow/install-airflow.yml
