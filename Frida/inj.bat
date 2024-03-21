@echo off
if [%1]==[] goto arg
cls
echo "Se procedera a inyectar codigo..."
timeout /t 4
echo "Asegurate de tener el juego abierto."
echo "Una ves inyectado para deshabilitar SSL puedes usar el siguiente argumento: android sslpinning disable "
pause
objection --gadget "%1" explore
pause

:arg
echo "Necesitas tener en nombre del APK..."
frida-ps -Uia
exit /B 1

