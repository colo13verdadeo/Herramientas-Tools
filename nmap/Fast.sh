#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando la ip $1 rapidamente."
	nmap -F $1
fi

