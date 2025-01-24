#!/bin/bash

# Validar que se ingresen los cuatro argumentos
if [ $# -lt 4 ]; then
  echo "Faltan $(expr 4 - $#) argumentos"
  echo "Uso: $0 <dominio> <usuario> <contraseña> <IP>"
  exit 1
fi

# Asignar argumentos a variables
DOMINIO="$1"
USUARIO="$2"
CONTRASENA="$3"
IP="$4"

# Ejecutar el comando
bloodhound-python -c All -u "$USUARIO" -p "$CONTRASENA" -d "$DOMINIO" -ns "$IP"
# Verificar el resultado del comando
if [ $? -eq 0 ]; then
  echo "El comando se ejecutó satisfactoriamente."
else
  echo "Hubo un error al ejecutar el comando."
fi
