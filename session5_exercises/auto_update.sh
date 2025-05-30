#!/bin/bash

dnf list --upgrades | grep 'linux-image' > /dev/null
upgrade=$(echo $?)

if [ $upgrade -eq 0 ]; then
    echo "Kernel update detected, reboot required"
else
    echo "No reboot required"
fi