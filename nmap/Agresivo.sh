#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando la ip $1 sin RDns, a 5000 pqts/s y argrecivo."
	nmap --open -sS --min-rate 5000 -p- -Pn -vvv -n $1
fi
