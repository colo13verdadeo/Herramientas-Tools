#/bin/bash
if [ $# -eq 1 ]; then
	echo "Necesitas la IP y el Usuario listado."
else
	smbclient \\\\$1\\$2
fi
