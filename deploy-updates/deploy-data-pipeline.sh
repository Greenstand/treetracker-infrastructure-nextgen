#! /bin/bash


if [ "$1" = "" ]
then
  echo "Usage: $0 <hosts>"
  exit
fi
ENV=$1

ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/update-pipeline/update-pipeline-microservice.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/update-pipeline/update-pipeline-consumer.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/update-pipeline/update-pipeline-cron.yml
ansible-playbook  -i ../hosts/$ENV.hosts -l batch --user root  playbooks/update-pipeline/update-analysis-microservice.yml
