#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP: $1"
else
	echo "Empezando."
	wfuzz -c -w /Diccionarios/paginas/dns/subdomains-top1million-110000.txt --sc 200,202,204,301,302,307,403  -H "Host: FUZZ.$1" -u $1
#	gobuster vhost -u $1 -w /Diccionarios/paginas/dns/subdomains-top1million-110000.txt --append-domain
fi
