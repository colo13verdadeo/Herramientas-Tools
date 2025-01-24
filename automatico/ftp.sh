#!/bin/bash

ftp() {
    local input="$1"
    # Usamos sed para reemplazar @ con %40
    echo "$input" | sed 's/@/%40/g'
}

IP=$1
USUARIO=$2
CONTRASE=$(ftp "$3")

# Ejecutamos wget y capturamos la salida en CHECK
CHECK=$(wget -r ftp://$USUARIO:$CONTRASE@$IP/ -P $USUARIO@$IP 2>&1)

# Usamos grep con -q para verificar si la cadena "Login incorrect." está en la salida
echo "$CHECK" | grep -q "Login incorrect."

if [ $? -eq 1 ]; then
    # Si grep encuentra la cadena, imprimimos la salida
    echo -e "\e[36m\e[5m[+] Se ha descargado archivos del usuario \e[32m$USUARIO\e[0m"
    echo -e "\e[37m====		\e[34mArchivos\e[37m		====\e[0m"
    ls $USUARIO@$IP/*
    echo -e "\e[37m====		\e[34mFIN archivos\e[37m		====\e[0m"
else
    # Si grep no encuentra la cadena, se considera "KO"
    echo -e "\e[31m[-] Login incorrecto o inaccesible.\e[0m"
fi

