if [%1]==[] goto arg
jnitrace -l libaudio.so %1
exit /B 1

:arg
echo "Debes tener el Package..."
frida-ps -Uia
exit /B 1