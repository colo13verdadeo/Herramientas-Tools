if [ $# -eq 1 ] || [ $# -eq 2 ]; then
  cadaver http://$1/$2
else
  echo "Falta ingresar IP y Path(opcional)."
  echo "Opciones dentro: Put [Subir archivos]"
fi
