echo off

rem set arduino COM port nomber
set COM=5

rem if not default install path teraterm,
rem set teraterm path or add teraterm path to PATH environment variable.
rem �f�t�H���g�̃p�X�ȊO�ɃC���X�g�[�������ꍇ�Ateraterm�̃p�X��TT_PATH�ɐݒ肷�邩�A
rem ���ϐ�PATH��teraterm�̃p�X��ݒ肵�Ă��������B
set TT_PATH="ttpmacro.exe"
if not exist %TT_PATH% set TT_PATH="C:\Program Files\teraterm\ttpmacro.exe"
if not exist %TT_PATH% set TT_PATH="C:\Program Files (x86)\teraterm\ttpmacro.exe"
if not exist %TT_PATH% echo ###Error###:not exist %TT_PATH%. in %~0

rem define command
set ERR_ON=c
set ERR_OFF=C
set WARN_ON=d
set WARN_OFF=D
set NG_ON=e
set NG_OFF=E
set OK_ON=f
set OK_OFF=F
set TEST_ON=i
set TEST_OFF=I
set BUILD_ON=j
set BUILD_OFF=J
set OK_SOUND=T
set NG_SOUND=t


