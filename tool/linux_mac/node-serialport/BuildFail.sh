
call %~dp0..\_define.bat

node %~dp0\sendSerial.js %COM% %BUILD_OFF%%TESTING_OFF%%OK_OFF%%NG_ON%%ERR_ON%%NG_SOUND%

rem sleep 1s
ping 127.0.0.1 -n2 >nul

rem NG_SOUND again
node %~dp0\sendSerial.js %COM% %NG_SOUND%

