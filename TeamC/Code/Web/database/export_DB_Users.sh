#!/bin/sh

#displaying info message and password
echo "connecting to mysql and exporting users from 'asi' database"
echo "(password is 'fall2015)"

#connecting to mysql and exporting the users from 'asi' database
mysqldump -u root -p asi > datadump_asiUsers.sql

