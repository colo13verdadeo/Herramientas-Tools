##Conectarse al FTP de forma anonima [solo si esta activado]
#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Intentando entrar en: $1 como anoymmous."
	ftp anonymous@$1
fi

