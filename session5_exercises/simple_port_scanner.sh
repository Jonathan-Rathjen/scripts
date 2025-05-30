#!/bin/bash

port_list=("22" "80" "443" "25" "53")

for num in ${port_list[@]}; do
    nc -zv localhost $num > /dev/null 2>&1
    status=$(echo $?)
    if [[ $status -eq 0 ]]; then
        echo "Port $num is open"
    else
        echo "Port $num is closed"
    fi
done
