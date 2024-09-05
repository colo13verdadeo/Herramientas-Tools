if [ $# -eq 3 ]; then
  echo davtest -auth $3 -url http://$1/$2
else
  if [ $# -eq 2 ]; then
    echo davtest -url http://$1/$2
  else
  echo "Necesitas la ip/dominio, path y si tene contraseña usar: USER:PASS"
  fi
fi
