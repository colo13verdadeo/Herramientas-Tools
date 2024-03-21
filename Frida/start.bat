@echo off

if [%1]==[] goto arg

frida -U -f %1 -l ./HTB.js

:arg
@echo Debes tener el Package antes de ejecutarlo...
@echo Checkando APKs...
frida-ps -Uia
exit /B 1