#!/bin/bash

# Create a timestamped log file
# Define a list of services
# For each service:
#    Check its status using systemctl
#    If active → log "service is running"
#    Else → log "service is down"

echo $(date) >> var/log/service_health_log

$(systemctl status httpd) > /dev/null
status=$(echo $?)

if [ $status -eq 0 ]; then
    echo "apache2 is running" >> var/log/service_health_log
else
    echo "apache2 is down" >> var/log/service_health_log
fi

$(systemctl status mysqld) > /dev/null
status=$(echo $?)

if [ $status -eq 0 ]; then
    echo "mysql is running" >> var/log/service_health_log
else
    echo "mysql is down" >> var/log/service_health_log
fi

$(systemctl status sshd) > /dev/null
status=$(echo $?)

if [ $status -eq 0 ]; then
    echo "ssh is running" >> var/log/service_health_log
else
    echo "ssh is down" >> var/log/service_health_log
fi

$(systemctl status crond.service) > /dev/null
status=$(echo $?)

if [ $status -eq 0 ]; then
    echo "cron is running" >> var/log/service_health_log
else
    echo "cron is down" >> var/log/service_health_log
fi
