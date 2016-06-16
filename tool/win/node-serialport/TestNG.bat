
call %~dp0..\_define.bat

node %~dp0\sendSerial.js %COM% %OK_OFF%%NG_ON%%NG_SOUND%%ERR_OFF%



