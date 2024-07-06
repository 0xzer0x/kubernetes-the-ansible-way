#!/bin/bash
set -e

ansible-playbook --ssh-common-args='-o StrictHostKeyChecking=no' -i ansible/inventory.yml ansible/playbook.yml "$@"
