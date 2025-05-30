#!/bin/bash

uptime_nums=$(uptime -p | grep -oP '\d+')
lines=$(echo "$uptime_nums" | wc -l)
minutes=$(echo "$uptime_nums" | tail -n 1)

if [[ $lines -eq 1 ]]; then
    if [[ $minutes -lt 5 ]]; then
        echo "System was recently rebooted"
    else
        echo "System is stable"
    fi
else
    echo "System is stable"
fi
