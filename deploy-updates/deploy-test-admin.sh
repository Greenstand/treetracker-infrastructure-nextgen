#! /bin/bash
ansible-playbook  -i ../hosts/test.hosts -l main --user root  playbooks/update-admin-api/update-admin-api.yml
ansible-playbook  -i ../hosts/test.hosts -l main --user root  playbooks/update-admin-client/update-admin-client.yml
