#!/bin/bash
if [ $# -eq 1 ]; then
	echo "Necesitas la IP y el Puerto o el Rango"
else
	echo "Analizando el puerto $2 de la ip $1."
	nmap $1 -sV -n -p$2
fi
