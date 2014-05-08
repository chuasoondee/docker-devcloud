# Gitolite
# VERSION 0.1

FROM 		sdchua/base
MAINTAINER 	Chua Soon Dee <soondee.chua@gmail.com>

# Git
RUN     	yum install -y git
RUN         yum install -y perl-Time-HiRes
RUN         adduser --system --create-home --shell /bin/bash git
RUN         su git -c "mkdir /home/git/bin"

ADD         id_rsa.pub /home/git/admin.pub

RUN         cd /home/git; su git -c "git clone git://github.com/sitaramc/gitolite";
RUN         cd /home/git; su git -c "gitolite/install -ln";
RUN         cd /home/git; su git -c "bin/gitolite setup -pk admin.pub"

CMD		    ["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
