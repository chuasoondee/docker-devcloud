# Base container with epel, sshd, supervisor
# VERSION 0.0.1

FROM centos
MAINTAINER Chua Soon Dee <soondee.chua@gmail.com>

# Add epel and update
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum update -y

# Install sshd
RUN yum install -y openssh-server
RUN chkconfig sshd off
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
# Line below seems to fix issue root not able to login via ssh
RUN sed 's/^session.*pam_loginuid.so/#&/' /etc/pam.d/sshd

# Install pip
RUN curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN python get-pip.py

# Install supervisor
RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
