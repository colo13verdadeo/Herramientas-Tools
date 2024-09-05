#/bin/bash
if [ $# -eq 0 ]; then
  john --format=NT $1
else
  echo "No has ingresado el path del archivo con el hash."
fi
