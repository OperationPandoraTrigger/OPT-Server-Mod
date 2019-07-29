:: This script starts the local arma dev-server (if it is even running)
:: All meta-information are set via the setServerData.bat script that
:: is being called from this one
@ECHO OFF

:: set meta infos
CALL "%~dp0.\setMetaData.bat"

:: change directory into the Arma directory (in which the server-exe resides)
CD /D "%armaDir%"

:: Kill the server
:: The loop occurs as long as the killing reports a success status as this means
:: there was a server process in the process table that was sent a kill-signal
:: However this also means that the server is still running and as Windows doesn't really
:: kill the program, we have to continously send the signal until the server is actually dead
ECHO Killing the (potentially) running server. This might take a while...
:killLoop
	TASKKILL /im %exeNameServer% > NUL 2>&1
	
	IF [%errorlevel%] == [0] (
		:: sleep 100ms
		CALL "%~dp0.\sleep.bat" 100
		GOTO :killLoop
	) ELSE (
		:: wait another 100ms and check again if the server was _really_ (hard)killed
		CALL "%~dp0.\sleep.bat" 100
		TASKKILL /F /IM %exeNameServer% > NUL 2>&1
		IF [%errorlevel%] == [0] (
			:: apparently the server isn't as dead as it seemed
			GOTO :killLoop
		)
	)

ECHO Successfully killed the server
