
call _define.bat

if not exist %TT_PATH% pause
if exist %TT_PATH% echo OK:exist %TT_PATH%

%TT_PATH% %~dp0\sendSerial.ttl %COM% cdeft

TIMEOUT 5

%TT_PATH% %~dp0\sendSerial.ttl %COM% CDEFT

