# Base Dockerfile.
# Includes epel, sshd, supervisord
# Version 0.1

FROM		base
MAINTAINER	Chua Soon Dee <soondee.chua@gmail.com>

# EPEL
RUN		    rpm -Uvh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN         yum clean all && yum update -y

# TOOLS
RUN         yum install -y tar

# SSHD
RUN		    yum install -y openssh-server
RUN		    chkconfig sshd off
RUN		    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN		    sed -i.bak 's/^session.*pam_loginuid.so/#&/' /etc/pam.d/sshd

# SUPERVISORD
RUN		    curl -O -L -G -d "raw=true" https://github.com/pypa/pip/blob/develop/contrib/get-pip.py
RUN		    python get-pip.py && rm get-pip.py
RUN		    pip install supervisor
ADD		    supervisord.conf /etc/supervisord/supervisord.conf

# Do not by default expose ssh
# EXPOSE	22
CMD		    ["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
