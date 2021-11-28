FROM debian:stable-20211115-slim

RUN apt update && apt install -y ansible shellcheck

RUN useradd -ms /bin/bash ansible
USER ansible
WORKDIR /home/ansible/infra

RUN ansible-galaxy install jnv.unattended-upgrades

CMD ["bash"]
