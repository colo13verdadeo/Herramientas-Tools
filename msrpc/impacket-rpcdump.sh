impacket-rpcdump
#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Necesitas la IP"
else
	echo "Analizando archivos compartidos de windows desde la ip: $1."
	impacket-rpcdump
