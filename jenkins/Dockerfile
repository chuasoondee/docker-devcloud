# Jenkins
# VERSION 0.2

FROM        sdchua/base
MAINTAINER  Chua Soon Dee <soondee.chua@gmail.com>

# REPO RPMFORGE. For upgrading git to > 1.7.1
RUN         rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
ADD         rpmforge.repo /etc/yum.repos.d/rpmforge.repo

# PROG/UTIL
RUN	        yum install -y java-1.7.0-openjdk which tar git

# JENKINS
RUN         adduser --system --create-home --shell /bin/bash jenkins
RUN         curl http://pkg.jenkins-ci.org/redhat/jenkins.repo > /etc/yum.repos.d/jenkins.repo
RUN         rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN         yum install -y jenkins
RUN         chkconfig jenkins off

# NODEJS and NPM
RUN         yum install -y nodejs
RUN         sh -c "exec >/dev/tty 2>/dev/tty </dev/tty && curl -L https://npmjs.org/install.sh | sh"
RUN         npm install -g bower

VOLUME      /home/jenkins

ADD         start.sh /opt/start.sh
ADD	        jenkins-supervisord.conf /etc/supervisord/jenkins-supervisord.conf

EXPOSE	    8080
CMD         ["/opt/start.sh"]
