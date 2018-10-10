FROM swapnilkhedekar/ubuntu:16.04
MAINTAINER Swapnil Khedekar  <swapnil.khedekar.25@gmail.com>

RUN apt-get update -qq
RUN apt-get install -y python python-pip
RUN apt-get install -y ansible

#### Some default ansible configuration and setup
RUN mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts

#### Enable log file
RUN sed -i 's/\#log_path/log_path/' /etc/ansible/ansible.cfg
RUN sed -i 's/\#host_key_checking/host_key_checking/' /etc/ansible/ansible.cfg

#### setting up private key
RUN mkdir -p /root/.ssh
COPY id_rsa /root/.ssh/
RUN chmod 400 ~/.ssh/id_rsa

RUN echo "ansibleclient1 ansible_host=ansibleclient1" >> /etc/ansible/hosts
RUN echo "ansibleclient2 ansible_host=ansibleclient2" >> /etc/ansible/hosts

CMD ["/bin/sh", "-c", "/usr/sbin/sshd && ansible --version && /bin/bash"]
