cd C:\Users\PC\Downloads
adb push 9a5ba575.0 /sdcard/
timeout /t 2
adb root
adb remount
timeout /t 2
@REM adb push frida-server-16.0.11-android-x86 /data/local/tmp/
adb push frida-server-16.2.1-android-x86_64 /data/local/tmp/
timeout /t 5
adb shell mv /sdcard/9a5ba575.0 /system/etc/security/cacerts/
adb shell chmod 777 /data/local/tmp/frida-server-16.2.1-android-x86_64
timeout /t 2
adb shell chmod 644 /system/etc/security/cacerts/9a5ba575.0
pause
