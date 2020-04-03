#! /bin/bash

if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/install-python/install-python.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/install-dependencies/install-dependencies.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/setup-pipeline-services/setup-pipeline-services.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/setup-analysis-pipeline-services/setup-analysis-pipeline-services.yml
