
call %~dp0\..\_define.bat

if not exist %TT_PATH% pause
if exist %TT_PATH% echo OK:exist %TT_PATH%

start /B /WAIT "sendSerial.ttl" %TT_PATH% %~dp0\sendSerial.ttl %COM% cdefghijt

TIMEOUT 5

start /B /WAIT "sendSerial.ttl" %TT_PATH% %~dp0\sendSerial.ttl %COM% CDEFGHIJT

