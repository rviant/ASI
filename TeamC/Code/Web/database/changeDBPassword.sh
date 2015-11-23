#!/bin/sh

echo "changing mysql password to fall2015"

#FORMAT:
#mysqladmin -u root -pcurrentpassword password 'newpassword'

mysqladmin -u root -pz1uFMFI7Rc password 'fall2015'
