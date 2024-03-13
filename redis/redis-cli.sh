#!/bin/bash
if [ $# -eq 1 ]; then
	echo "Necesitas la IP y el Puerto"
else
	echo "Accediento $1 con puerto $1."
	redis-cli -h $1 -p $2
fi
