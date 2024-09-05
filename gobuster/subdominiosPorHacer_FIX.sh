#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando directorios pequeños en la ip $1."
	wfuzz -c -t 200 --hl 337 -w /usr/share/SecLists/Discovery/DNS/subdomains-top1million-110000.txt -H "Host: FUZZ.$1" http://$1
fi
#-c --hh=$2
