#!/bin/bash

Define DB_NAME, USER, and BACKUP_DIR
Get current date
Run mysqldump and output to BACKUP_DIR/dbname-YYYYMMDD.sql
Print "Backup completed" if successful
