# Infra
## Setup
ansible-galaxy install jnv.unattended-upgrades
## Running
./run.sh ansible-playbook -i hosts playbook.yaml -K
## Issues
jnv.unattended-upgrades run somewhat old ansible, waiting for 2.0 release
prometheus keep getting deployed? Perhaps with related to pid(?)

