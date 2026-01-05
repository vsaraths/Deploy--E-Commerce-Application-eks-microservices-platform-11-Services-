#!/bin/bash
set -e

exec > /var/log/bootstrap.log 2>&1

echo "===== Installing Ansible ====="

apt update -y
apt install -y python3 python3-pip git
pip3 install ansible

echo "===== Running Ansible ====="
ansible-playbook /opt/ansible/site.yml
