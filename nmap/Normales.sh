#!/bin/bash
if [ $# -eq 1 ]; then
	echo "Necesitas la IP y el Puerto o el Rango"
else
	echo "Analizando el puertos comunes de la ip $1."
	nmap -n $1 -p3306,6379,5985

