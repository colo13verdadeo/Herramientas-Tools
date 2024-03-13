#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas el archivo"
else
	echo "john -w=/Diccionarios/comun/rockyou-75.txt $1"
fi
