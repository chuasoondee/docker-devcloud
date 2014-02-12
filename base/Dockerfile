# Base Dockerfile.
# Includes epel, sshd, supervisord
# Version 0.0.1

FROM		base
MAINTAINER	Chua Soon Dee <soondee.chua@gmail.com>

RUN		rpm -Uvh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN		yum update -y

RUN		yum install -y openssh-server
RUN		chkconfig sshd off
RUN		ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN		sed 's/^session.*pam_loginuid.so/#&/' /etc/pam.d/sshd

RUN		curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN		python get-pip.py

RUN		pip install supervisor
ADD		supervisord.conf /etc/supervisord/supervisord.conf

EXPOSE	22
CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
