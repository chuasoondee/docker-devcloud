# Centos & EPEL mirror Dockerfile.
# Includes epel, sshd, supervisord
# Version 0.0.1

FROM		sdchua/base
MAINTAINER	Chua Soon Dee <soondee.chua@gmail.com>

RUN         yum install -y nginx
RUN         rm /etc/nginx/conf.d/*.conf
ADD         repo-nginx.conf /etc/nginx/conf.d/repo-nginx.conf
ADD	        repo-supervisord.conf /etc/supervisord/
VOLUME      /repo

EXPOSE	    80
CMD		    ["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
