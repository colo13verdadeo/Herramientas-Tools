#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP o DOMINIO"
else
	echo "Analizando la ip $1."
	nmap $1 -sVC --min-rate 5000 -oN nmapCTF.nmap
fi
