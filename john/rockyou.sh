#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas el archivo"
else
	john -w=/usr/share/seclists/Passwords/Leaked-Databases/rockyou-75.txt $1
fi
