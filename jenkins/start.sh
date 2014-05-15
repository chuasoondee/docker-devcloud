#!/bin/bash

chown -R jenkins:jenkins /home/jenkins

/usr/bin/supervisord -c /etc/supervisord/supervisord.conf

