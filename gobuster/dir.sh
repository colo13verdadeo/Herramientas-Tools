#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando directorios pequeños en la ip $1."
	gobuster dir -u $1 -w /Diccionarios/paginas/directory-list-2.3-small.txt
fi
