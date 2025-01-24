#/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	crackmapexec smb $1 -u anonymous -p "" --rid-brute 10000
fi
