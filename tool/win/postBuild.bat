echo on

echo JOB_URL=%JOB_URL%

rem wget -O - --auth-no-challenge --http-user=apiUser --http-password=2200a230d4748bf84a3688b8891ae997 http://192.168.179.8:8080/job/TestJob/lastBuild/api/xml

rem curl %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>SUCCESS</result>"
wget -O - --auth-no-challenge --http-user=apiUser --http-password=2200a230d4748bf84a3688b8891ae997 %JOB_URL%/%BUILD_NUMBER%/api/xml | grep "<result>SUCCESS</result>"

set TestResult=%ERRORLEVEL%
echo TestResult=%TestResult%

if %TestResult% == 0 (
	call %~dp0\node-serialport\TestOK.bat
) else (
	call %~dp0\node-serialport\TestNG.bat
)



