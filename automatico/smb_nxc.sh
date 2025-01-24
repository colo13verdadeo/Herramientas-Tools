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

# Ejecutar el comando y procesar en tiempo real
while IFS= read -r line; do
  echo "$line"  # Mostrar la salida en vivo
  if echo "$line" | grep -q "STATUS_LOGON_FAILURE"; then
    RESULTADO="KO"
    break  # Salir del bucle inmediatamente
  fi
done < <(nxc smb "$IP" -u "$USUARIO" -p "$CONTRASENA" --users 2>&1)

# Imprimir el resultado final
echo "$RESULTADO"
if [ "$RESULTADO" == "KO" ]; then
  exit 1
else
  exit 0
fi

