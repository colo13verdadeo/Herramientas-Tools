@echo off
cls
echo "Se procedera a inyectar el android...\nPara cancelar precionar Control+C"
title frida
adb devices
timeout /t 1
@REM Ejecutar adb connect 127.0.0.1:62001
@REM Ejecutar adb connect 127.0.0.1:5555
timeout /t 2
:: start "" "inj.bat"
@REM adb shell "/data/local/tmp/frida-server-16.2.1-android-x86_64 &"
adb shell "/data/local/tmp/frida-server-16.0.11-android-x86 &"
timeout /t 3
pause
@REM adb shell am clear-debug-app