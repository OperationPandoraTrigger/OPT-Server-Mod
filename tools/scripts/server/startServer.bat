@echo off

:: set the armaDir and the exeName variable
call %~dp0\setServerData.bat

cd /d "%armaDir%"

set "clib=%modDir%\@CLib"
set "opt=%modDir%\@OPT"

echo Trying to copy config file. This might take a few seconds...
:copyLoop
	copy "%~dp0.\serverConfig.cfg" "%armaDir%" > NUL 2>&1

	if not [%errorlevel%] == [0]  (
		timeout 1 >NUL
		goto :copyLoop
	)


start /min %exeName% -config=serverConfig.cfg -serverMod="%clib%;%opt%" -debugCallExtension

pause