#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas el archivo"
else
	echo "john -w=/usr/share/SecLists/Passwords/Leaked-Databases/rockyou-75.txt $1"
fi
