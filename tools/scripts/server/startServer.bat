:: This script starts the local arma dev-server
:: All meta-information are set via the setServerData.bat script that
:: is being called from this one
@echo off

:: set meta infos
call %~dp0\setMetaData.bat

:: change directory into the Arma directory (in which the server-exe resides)
cd /d "%armaDir%"

set "clib=%modDir%\@CLib"
set "opt=%modDir%\@OPT"

:: Copy the server-config into the arma-dir as Arma can only read configs relative
:: to the exe
echo Trying to copy config file. This might take a while...
:copyLoop
	copy "%~dp0.\serverConfig.cfg" "%armaDir%" > NUL 2>&1

	if not [%errorlevel%] == [0]  (
		:: sleep 100ms
		pathping localhost -n -q 1 -p 100 >nul
		goto :copyLoop
	)

:: Start the server and minimize it once it's started
start /min %exeName% -config=serverConfig.cfg -serverMod="%clib%;%opt%" -debugCallExtension

echo Successfully started the server