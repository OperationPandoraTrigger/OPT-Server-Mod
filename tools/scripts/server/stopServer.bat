:: This script starts the local arma dev-server (if it is even running)
:: All meta-information are set via the setServerData.bat script that
:: is being called from this one
@echo off

:: set meta infos
call %~dp0.\setMetaData.bat

:: change directory into the Arma directory (in which the server-exe resides)
cd /d %armaDir%

:: Kill the server
:: The loop occurs as long as the killing reports a success status as this means
:: there was a server process in the process table that was sent a kill-signal
:: However this also means that the server is still running and as Windows doesn't really
:: kill the program, we have to continously send the signal until the server is actually dead
echo Killing the (potentially) running server. This might take a while...
:killLoop
	taskkill /im %exeName% > NUL 2>&1
	
	if [%errorlevel%] == [0] (
		:: sleep 100ms
		call %~dp0.\sleep.bat 100
		goto :killLoop
	) else (
		:: wait another 100ms and check again if the server was _really_ (hard)killed
		call %~dp0.\sleep.bat 100
		taskkill /f /im %exeName% > NUL 2>&1
		if [%errorlevel%] == [0] (
			:: apparently the server isn't as dead as it seemed
			goto :killLoop
		)
	)

echo Successfully killed the server