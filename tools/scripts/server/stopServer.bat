:: This script starts the local arma dev-server (if it is even running)
:: All meta-information are set via the setServerData.bat script that
:: is being called from this one
@echo off

:: set meta infos
call %~dp0\setServerData.bat

:: change directory into the Arma directory (in which the server-exe resides)
cd /d %armaDir%

:: Kill the server
:: The loop occurs as long as the killing reports a success status as this means
:: there was a server process in the process table that was sent a kill-signal
:: However this also means that the server is still running and as Windows doesn't really
:: kill the program, we have to continously send the signal until the server is actually dead
echo Killing the (potentially) running server. This might take a few seconds...
:killLoop
	taskkill /im %exeName% > NUL 2>&1
	
	if [%errorlevel%] == [0] (
		timeout 1 >NUL
		goto :killLoop
	)