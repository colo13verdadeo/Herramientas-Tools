@echo off

if [%1]==[] goto arg
:OK
@echo Obteniendo el Path...
adb shell pm path %1
exit /B 1
:arg
@echo Para checkear el PATH debes adjuntar el package a buscar.
@echo Checkando APKs..
frida-ps -Uia
exit /B 1
goto :eof
