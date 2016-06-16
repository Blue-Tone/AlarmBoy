
call %~dp0\_define.bat

start /B /WAIT "sendSerial.ttl" %TT_PATH% %~dp0\sendSerial.ttl %COM% %ERR_OFF%



