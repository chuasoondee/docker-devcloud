# Jenkins
# VERSION 0.0.2

FROM sdchua/base
MAINTAINER Chua Soon Dee <soondee.chua@gmail.com>

# JDKs
RUN     yum install -y java-1.7.0-openjdk

# JENKINS
RUN     curl http://pkg.jenkins-ci.org/redhat/jenkins.repo > /etc/yum.repos.d/jenkins.repo
RUN     rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN     yum install -y jenkins
RUN     chkconfig jenkins off

VOLUME  /home/jenkins

ADD		jenkins-supervisord.conf /etc/supervisord/jenkins-supervisord.conf

EXPOSE	8080
CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
