
call %~dp0..\_define.bat

rem start /B /WAIT "sendSerial.ttl" %TT_PATH% /V %~dp0\sendSerial.ttl %COM% %BUILD_ON%
rem start /WAIT "sendSerial.ttl" %TT_PATH% /V %~dp0\sendSerial.ttl %COM% %BUILD_ON%
%TT_PATH% /V %~dp0\sendSerial.ttl %COM% %BUILD_ON%



