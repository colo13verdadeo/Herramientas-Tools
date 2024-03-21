@echo off

if [%1]==[] goto arg
:OK
@echo Extrayendo el apk...
adb pull %1
exit /B 1
:arg
@echo Primero debes tener el Path.
exit /B 1