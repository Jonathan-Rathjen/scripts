#!/bin/bash

 size=$(du -h /var/log/httpd/access_log)
 num=$(echo $size | grep -oP '\d+')

 echo $size | grep K > /dev/null
 kilo=$(echo $?)

 echo $size | grep M > /dev/null
 mega=$(echo $?)

 echo $size | grep G > /dev/null
 giga=$(echo $?)

if [[ $kilo -eq 0 ]]; then
    echo "Log size is less than 100MB"
    exit
elif [[ $mega -eq 0 ]]; then
    if [[ $num -gt 100 ]]; then
        tar -czf access_log_$(date +%F).gz /var/log/httpd/access_log
        : > /var/log/httpd/access_log
        systemctl restart httpd
    else
        echo "Log size is less than 100MB"
    fi
    exit
else
    tar -czf access_log_$(date +%F).gz /var/log/httpd/access_log
    : > /var/log/httpd/access_log
    systemctl restart httpd
fi