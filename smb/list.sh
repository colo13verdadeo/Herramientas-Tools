#/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	smbclient -L $1
fi
