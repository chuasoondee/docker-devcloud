# MySQL
# VERSION 0.0.1
# Great post that got this docker working http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/

FROM sdchua/base
MAINTAINER Chua Soon Dee <soondee.chua@gmail.com>

# MYSQL
RUN     yum install -y mysql-server

ADD     my.cnf /etc/my.cnf
ADD     start.sh /opt/start.sh
ADD     mysql-supervisord.conf /etc/supervisord/mysql-supervisord.conf

# VOLUME
VOLUME  /var/lib/mysql

EXPOSE	3306
CMD     ["/opt/start.sh"]
