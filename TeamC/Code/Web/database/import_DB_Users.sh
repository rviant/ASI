#!/bin/sh

#displaying info message and password
echo "connecting to mysql and importing users to 'asi' database"
echo "(password is 'fall2015)"

#connecting to mysql and updating the users of 'asi' database
mysql -u root -p asi < datadump_asiUsers.sql

