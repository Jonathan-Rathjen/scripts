#!/bin/bash

website=httpd
systemctl status $website > /dev/null
status=$(echo $?)

if [[ status -eq 0 ]]; then
    echo "SERVER ACTIVE"
    echo "Server Active - $(date)" >> /var/www/html/apache_log.log

elif [[ status != 0 ]]; then
    echo "SERVER INACTIVE"
    systemctl restart $website
    echo "Server inactive - $(date)" >> /var/www/html/apache_log.log

else
    echo "STATUS UNKNOWN"
    echo echo "Server status unkown - $(date)" >> /var/www/html/apache_log.log

fi