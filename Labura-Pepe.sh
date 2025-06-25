#!/bin/bash

#   Necesitamos o ser root o tener sudo
if [[ "$EUID" -ne 0 ]]
    then echo "Necesitas permisos de root"
    exit
fi

#   Tenes permisos para correr el script
echo "Corriendo como pepe manda"

VALOR="http_proxy $1"
VALOR1="https_proxy $1"

CNT="
http_proxy $1
https_proxy $1
HTTP_PROXY $1
HTTPS_PROXY $1 
"

#   Uno de los archivos a tocar es este
FILE="/etc/environment"
#   Veo si existe
if [ -e $FILE ]
   then echo "El archivo existe"
   echo "$CNT" > $FILE
else
   echo "El archivo no existe"
   touch $FILE
   echo "$CNT" > $FILE
fi

FAPT="/etc/apt/apt.conf"
CNT1="
Acquire::http::Proxy  $1 ; 
Acquire::https::Proxy  $1 ; 
Acquire::ftp::Proxy $1 ;
"

#   Veo si existe
if [ -e $FAPT ]
   then echo "El archivo existe"
   echo $FAPT
else
   echo "El archivo no existe"
   touch $FAPT
   echo $CNT1 > $FAPT
fi
