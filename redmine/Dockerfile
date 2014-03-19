# Redmine Dockerfile.
# Version 0.0.1

FROM		sdchua/base
MAINTAINER	Chua Soon Dee <soondee.chua@gmail.com>

# Add ruby and redmine RPMs
ADD		rpms/ruby-1.9.3_p484_x86_64.rpm ruby-1.9.3_p484_x86_64.rpm
ADD		rpms/redmine_2.5.0_x86_64.rpm redmine_2.5.0_x86_64.rpm

# Install ruby and redmine
RUN		yum install -y ruby-1.9.3_p484_x86_64.rpm
RUN		yum install -y redmine_2.5.0_x86_64.rpm
RUN		gem install bundler
ADD     database.yml /opt/redmine/config/database.yml
ADD     redmine-supervisord.conf /etc/supervisord/redmine-supervisord.conf

# Configure redmine
WORKDIR /opt/redmine
ENV     RAILS_ENV production
RUN     /usr/bin/bundle exec rake generate_secret_token

EXPOSE  3000
CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
