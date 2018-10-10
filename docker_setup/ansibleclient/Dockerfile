FROM ubuntu:16.04
MAINTAINER Swapnil Khedekar <swapnil.khedekar.25@gmail.com>
WORKDIR /root

# setting up UTF-8 encoding
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND "noninteractive"


RUN apt-get update -qq && \
    apt-get install -y software-properties-common && \
    apt-get install -y apt-utils tzdata && \
    echo 'Asia/Calcutta' > /etc/timezone && \
    dpkg-reconfigure tzdata


RUN apt-get install -y sudo vim less telnet net-tools curl inetutils-ping openssh-server ufw
RUN apt-get install -y python python-pip
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get autoremove -y

# configure ssh and password
RUN mkdir /var/run/sshd
RUN echo 'root:changeme' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


# SSH login fix. Otherwise user is kicked off after login$
RUN ls -ltr /etc/pam.d
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

#### setting up public key
RUN mkdir -p /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys

CMD ["/bin/sh", "-c", "/usr/sbin/sshd; python --version; /bin/bash"]
