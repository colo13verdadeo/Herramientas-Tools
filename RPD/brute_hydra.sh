if [ $# -eq 4 ]; then
  hydra -L $1 -P $2 rdp://$3 -s $4
else
  echo "Se necesita 4 argumentos: ArchivoUsuarios, ArchivosContraseñas, IP, PUERTO."
fi
