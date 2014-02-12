# Jenkins
# VERSION 0.0.1

FROM sdchua/base
MAINTAINER Chua Soon Dee <soondee.chua@gmail.com>

# Install jenkins
RUN     yum install -y java-1.7.0-openjdk
RUN     curl http://pkg.jenkins-ci.org/redhat/jenkins.repo > /etc/yum.repos.d/jenkins.repo
RUN     rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN     yum install -y jenkins

ADD		jenkins-supervisord.conf /etc/supervisord/jenkins-supervisord.conf

EXPOSE	8080
CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
