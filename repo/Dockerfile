# Centos & EPEL mirror Dockerfile.
# Includes epel, sshd, supervisord
# Version 0.0.1

FROM		base
MAINTAINER	Chua Soon Dee <soondee.chua@gmail.com>

# EPEL
RUN 		rpm -Uvh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN 		yum update -y

# NGINX
RUN         yum install -y nginx
RUN         rm /etc/nginx/conf.d/*.conf
ADD         repo-nginx.conf /etc/nginx/conf.d/repo-nginx.conf
#ADD	        repo-supervisord.conf /etc/supervisord/
VOLUME      /repo

EXPOSE	    80
#CMD		    ["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
CMD         ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]
