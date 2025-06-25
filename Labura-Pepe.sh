#!/bin/bash

#   Necesitamos o ser root o tener sudo
if [[ "$EUID" -ne 0 ]]
    then echo "Necesitas permisos de root"
    exit
fi

#   Tenes permisos para correr el script
echo "Corriendo como pepe manda"