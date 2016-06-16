rem 1:debug ON, 0;debug OFF
set DEBUG=1

rem Build and Test LED Off 
call %~dp0\node-serialport\BuildOff.bat
call %~dp0\node-serialport\TestingOff.bat
echo on

rem output log api/xml
rem wget -O - --auth-no-challenge --http-user=apiUser --http-password=2200a230d4748bf84a3688b8891ae997 http://192.168.179.8:8080/job/TestJob/lastBuild/api/xml

rem curl sample
rem curl %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>SUCCESS</result>"


rem check SUCCESS
wget -O - --auth-no-challenge --http-user=apiUser --http-password=2200a230d4748bf84a3688b8891ae997 %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>SUCCESS</result>"
set SUCCESS=%ERRORLEVEL%
echo SUCCESS=%SUCCESS%

rem check UNSTABLE
wget -O - --auth-no-challenge --http-user=apiUser --http-password=2200a230d4748bf84a3688b8891ae997 %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>UNSTABLE</result>"
set UNSTABLE=%ERRORLEVEL%
echo UNSTABLE=%UNSTABLE%


if %SUCCESS% == 0 (
	rem SUCCESS
	call %~dp0\node-serialport\TestOK.bat
	if %DEBUG% == 1 ( copy /Y C:\jenkins_ws\testResult_UNSTABLE.xml C:\jenkins_ws\testResult.xml )
) else (
	if %UNSTABLE% == 0 (
		rem UNSTABLE
		call %~dp0\node-serialport\TestNG.bat
		if %DEBUG% == 1 ( copy /Y C:\AlarmBoy\tool\win\node-serialport\TestingOn_DebugNG.bat C:\AlarmBoy\tool\win\node-serialport\TestingOn.bat )
		if %DEBUG% == 1 ( copy /Y C:\jenkins_ws\testResult_SUCCESS.xml C:\jenkins_ws\testResult.xml )
	) else (
		rem FAILURE,ABORTED,NOT_BUILT
		call %~dp0\node-serialport\BuildFail.bat
		if %DEBUG% == 1 ( copy /Y C:\AlarmBoy\tool\win\node-serialport\TestingOn_DebugOK.bat C:\AlarmBoy\tool\win\node-serialport\TestingOn.bat )
	)
)


