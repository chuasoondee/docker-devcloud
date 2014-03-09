# MySQL
# VERSION 0.0.1
# Great post that got this docker working http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/

FROM sdchua/base
MAINTAINER Chua Soon Dee <soondee.chua@gmail.com>

# MYSQL
RUN     yum install -y mysql-server

ADD     my.cnf /etc/my.cnf
ADD     configure.sh /configure.sh
RUN     /configure.sh

ADD     mysql-supervisord.conf /etc/supervisord/mysql-supervisord.conf

EXPOSE	3306
CMD     ["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
