:: This script starts the local arma dev-server
:: All meta-information are set via the setMetaData.bat script that
:: is being called from this one
@ECHO OFF

:: set meta infos
CALL "%~dp0.\setMetaData.bat"

:: convert relative to absolute path of clib
:: so armaserver can read it properly
IF NOT EXIST "%~dp0..\..\..\PBOs\dev\@CLib" (
	ECHO Can't find PBOs\dev\@CLib - did you forget to build CLib before?
	PAUSE
	EXIT 1
)
PUSHD "%~dp0..\..\..\PBOs\dev\@CLib"
SET "CLib_Dir=%CD%"
POPD

:: convert relative to absolute path of opt
:: so armaserver can read it properly
IF NOT EXIST "%~dp0..\..\..\PBOs\dev\@OPT" (
	ECHO Can't find PBOs\dev\@OPT - did you forget to build the OPT-mod before?
	PAUSE
	EXIT 1
)
PUSHD "%~dp0..\..\..\PBOs\dev\@OPT"
SET "OPT-Server_Dir=%CD%"
POPD

:: change directory into the Arma directory (in which the server-exe resides)
CD /D "%armaDir%"

:: Copy the server-config into the arma-dir as Arma can only read configs relative
:: to the exe
ECHO Trying to copy config file. This might take a while...
:copyLoop
	COPY /Y "%~dp0.\serverConfig.cfg" "%armaDir%" > NUL 2>&1

	IF NOT [%errorlevel%] == [0]  (
		:: sleep 100ms
		CALL "%~dp0.\sleep.bat" 100
		GOTO :copyLoop
	)

:: Start the server and minimize it once it's started
START /MIN %exeNameServer% -config=serverConfig.cfg -profiles=OPT_DevServer -filePatching -serverMod="%CLib_Dir%;%OPT-Server_Dir%" -mod="%additionalMods%;%OPT-Client_Dir%" -debugCallExtension
