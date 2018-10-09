FROM swapnilkhedekar/ubuntu:16.04
MAINTAINER Swapnil Khedekar  <swapnil.khedekar.25@gmail.com>

RUN apt-get update -q -q
RUN apt-get install -y python python-pip

#### setting up public key
RUN mkdir -p /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys

CMD ["/bin/sh", "-c", "/usr/sbin/sshd; python --version; /bin/bash"]
