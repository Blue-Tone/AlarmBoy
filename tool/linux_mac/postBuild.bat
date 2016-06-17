call %~dp0_define.bat

rem Build and Testing LED Off 
call %~dp0\node-serialport\BuildOff.bat
call %~dp0\node-serialport\TestingOff.bat

rem output log api/xml
rem wget -O - --auth-no-challenge --http-user=%USER% --http-password=%API_TOKEN% %JOB_URL%/%BUILD_NUMBER%/api/xml

rem curl sample
rem curl %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>SUCCESS</result>"


rem check SUCCESS
wget -O - --auth-no-challenge --http-user=%USER% --http-password=%API_TOKEN% %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>SUCCESS</result>"
set SUCCESS=%ERRORLEVEL%
echo SUCCESS=%SUCCESS%

rem check UNSTABLE
wget -O - --auth-no-challenge --http-user=%USER% --http-password=%API_TOKEN% %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>UNSTABLE</result>"
set UNSTABLE=%ERRORLEVEL%
echo UNSTABLE=%UNSTABLE%


if %SUCCESS% == 0 (
	rem SUCCESS
	call %~dp0\node-serialport\TestOK.bat
) else (
	if %UNSTABLE% == 0 (
		rem UNSTABLE
		call %~dp0\node-serialport\TestNG.bat
	) else (
		rem FAILURE,ABORTED,NOT_BUILT
		call %~dp0\node-serialport\BuildFail.bat
	)
)


