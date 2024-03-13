#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando la ip $1 sin RDns."
	nmap -n $1
fi
