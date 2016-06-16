echo off
rem ---------------- MUST SETUP----------------
rem Environment dependent Config. 環境依存設定

rem set NODE_PATH. for call node-serialport
set NODE_PATH=C:\Users\admin\AppData\Roaming\npm\node_modules

rem set arduino COM port number
set COM=3


rem -------------- define command -------------
call %~dp0\_definePin.bat

set ERR_ON=%D2_ON%
set ERR_OFF=%D2_OFF%
set WARN_ON=%D3_ON%
set WARN_OFF=%D3_OFF%
set NG_ON=%D4_ON%
set NG_OFF=%D4_OFF%
set OK_ON=%D5_ON%
set OK_OFF=%D5_OFF%
set TESTING_ON=%D8_ON%
set TESTING_OFF=%D8_OFF%
set BUILD_ON=%D9_ON%
set BUILD_OFF=%D9_OFF%
set NG_SOUND=%A5_ON%
set OK_SOUND=%A5_OFF%


rem ---------------- teraterm -----------------
rem if not default install path teraterm, set teraterm path or add teraterm path to PATH environment variable.
rem デフォルトのパス以外にインストールした場合、teratermのパスをTT_PATHに設定するか、環境変数PATHにteratermのパスを設定してください。
set TT_PATH="ttpmacro.exe"
if not exist %TT_PATH% set TT_PATH="C:\Program Files\teraterm\ttpmacro.exe"
if not exist %TT_PATH% set TT_PATH="C:\Program Files (x86)\teraterm\ttpmacro.exe"
if not exist %TT_PATH% echo ###Error###:not exist %TT_PATH%. see %~0
