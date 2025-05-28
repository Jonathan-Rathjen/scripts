#!/bin/bash

# Define a list of URLs
# For each URL:
#    Use curl -o /dev/null -s -w "%{http_code}" to get status
#    If 200 → print "OK"
#    Else → print "ERROR" with code

localhost=http://localhost
akumo=https://code.akumotechnology.com
digitalocean=https://www.digitalocean.com

local_status=$(curl -o /dev/null -s -w %{http_code} http://localhost)
akumo_status=$(curl -o /dev/null -s -w %{http_code} https://code.akumotechnology.com)
ocean_status=$(curl -o /dev/null -s -w %{http_code} https://www.digitalocean.com)

if [ $local_status -eq 200 ]; then
    echo "localhost: OK"
else
    echo "localhost: ERROR"
fi

if [ $ocean_status -eq 200 ]; then
    echo "digital ocean: OK"
else
    echo "digital ocean: ERROR"
fi

if [ $akumo_status -eq 200 ]; then
    echo "akumo technology: OK"
else
    echo "akumo technology: ERROR"
fi