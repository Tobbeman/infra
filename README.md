# Infra
## Setup
ansible-galaxy install jnv.unattended-upgrades
## Running
ansible-playbook -i hosts playbook.yaml -K
## Issues
jnv.unattended-upgrades run somewhat old ansible, waiting for 2.0 release

