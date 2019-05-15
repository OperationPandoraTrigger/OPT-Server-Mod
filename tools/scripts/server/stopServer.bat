@echo off

:: set the armaDir and the exeName variable
call %~dp0\setServerData.bat

cd /d %armaDir%

echo Killing the (potentially) running server. This might take a few seconds...
:killLoop
	taskkill /im %exeName% > NUL 2>&1
	
	if [%errorlevel%] == [0] (
		timeout 1 >NUL
		goto :killLoop
	)