#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando directorios pequeños en la ip $1."
	gobuster dir -u $1 -b 404 -w /usr/share/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt --exclude-length 352 -t 20
fi
