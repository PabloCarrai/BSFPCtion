#!/bin/bash

#  Variables con la info del proxy
VALOR="http_proxy $1"
VALOR1="https_proxy $1"
CNT="http_proxy $1\nhttps_proxy $1\nHTTP_PROXY $1\nHTTPS_PROXY $1"
#   Uno de los archivos a tocar es este
FILE="/etc/environment"
FAPT="/etc/apt/apt.conf"
CNT1="Acquire::http::Proxy \"$1\";\nAcquire::https::Proxy \"$1\";\nAcquire::ftp::Proxy \"$1\";\n"

#   Necesitamos o ser root o tener sudo
if [[ "$EUID" -ne 0 ]]
   then echo "Necesitas permisos de root"
   return -1
fi


if [[ $1 = "sinproxy" ]]
   then rm $FILE $FAPT
else
   #   Veo si existe
   if [ -e $FILE ]
      then echo "El archivo existe"
      echo -e "$CNT" > $FILE
   else
      echo "El archivo no existe"
      touch $FILE
      echo -e "$CNT" > $FILE
   fi

   #   Veo si existe
   if [ -e $FAPT ]
      then echo "El archivo existe"
      echo -e $CNT1 > $FAPT
   else
      echo "El archivo no existe"
      touch $FAPT
      echo -e $CNT1 > $FAPT
   fi
fi
#	Faltaria ver como chequear que este instalado edge
#	y como meter esto en la conf de firefox
#microsoft-edge --proxy-server="http://10.0.0.100:8080" --proxy-bypass-list="*.google.com,localhost"
