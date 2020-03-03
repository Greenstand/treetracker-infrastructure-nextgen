#! /bin/bash
ansible-playbook  -i ../hosts/prod.hosts -l token --user root  playbooks/install-python/install-python.yml
ansible-playbook  -i ../hosts/prod.hosts -l token --user root  playbooks/install-dependencies/install-dependencies.yml
ansible-playbook  -i ../hosts/prod.hosts -l token --user root  playbooks/setup-token-api-services/setup-token-api-services.yml
