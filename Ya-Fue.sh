#!/bin/bash

#   Necesitamos o ser root o tener sudo
if [[ "$EUID" -ne 0 ]]
then echo "Necesitas permisos de root"
exit 1
fi

#   Los archivos a unas variables
FILE="/etc/environment"
FAPT="/etc/apt/apt.conf"
#   Chequeo si existen
if [ -e $FILE ] && [ -e $FAPT ] 
then 
rm -rf $FILE $FAPT
echo "Listo borramos archivos"
fi