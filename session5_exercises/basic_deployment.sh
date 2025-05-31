#!/bin/bash

#set up html template
wget https://html5up.net/uploads/demos/story.zip
unzip story.zip
cd story
git init
git add .
git commit -m "Creating website template to push"

#push template to github
git remote add origin https://github.com/Jonathan-Rathjen/website-template.git
git branch -M main
git push -u origin main

#Clone the repo to apache
rm -rf /var/www/html/*
git clone https://github.com/Jonathan-Rathjen/website-template.git /var/www/html
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
systemctl restart httpd > /dev/null 
