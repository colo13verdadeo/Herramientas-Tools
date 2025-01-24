#!/bin/bash

# Validar que se ingresen los tres argumentos
if [ $# -lt 3 ]; then
  echo "Faltan $(expr 3 - $#) argumentos"
  echo "Uso: $0 <IP> <usuario> <contraseña>"
  exit 1
fi

# Asignar argumentos a variables
IP="$1"
USUARIO="$2"
CONTRASENA="$3"

# Inicializar variable de resultado
RESULTADO="OK"

# Guardar la salida en la variable OUTPUT
OUTPUT=$(nxc smb "$IP" -u "$USUARIO" -p "$CONTRASENA" --users 2>&1)

# Mostrar cada línea en "tiempo real"
if echo "$OUTPUT" | grep -q "STATUS_LOGON_FAILURE"; then
    RESULTADO="KO"
    break  # Salir del bucle si se detecta el error
fi

# Mostrar "hola" y el OUTPUT completo
echo "$OUTPUT"  # Mostrar el OUTPUT completo

# Imprimir el resultado final
echo "$RESULTADO"
if [ "$RESULTADO" == "KO" ]; then
  exit 1
else
  exit 0
fi

