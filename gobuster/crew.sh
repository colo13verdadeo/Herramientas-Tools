#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando directorios pequeños en la ip $1 con crew."
	cewl http://$1/ | grep -v CeWL > custom-cnames_CeWL.txt && gobuster vhost -w custom-cnames_CeWL.txt -u http://$1 --append-domain
fi
