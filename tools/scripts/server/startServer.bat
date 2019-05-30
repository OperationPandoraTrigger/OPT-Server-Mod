:: This script starts the local arma dev-server
:: All meta-information are set via the setMetaData.bat script that
:: is being called from this one
@echo off

:: set meta infos
call "%~dp0.\setMetaData.bat"

:: convert relative to absolute path of clib
:: so armaserver can read it properly
set "clib=%~dp0..\..\..\PBOs\dev\@CLib"
pushd "%clib%"
set "clib=%CD%"
popd

:: convert relative to absolute path of opt
:: so armaserver can read it properly
set "opt=%~dp0..\..\..\PBOs\dev\@OPT"
pushd "%opt%"
set "opt=%CD%"
popd

:: change directory into the Arma directory (in which the server-exe resides)
cd /d "%armaDir%"

:: Copy the server-config into the arma-dir as Arma can only read configs relative
:: to the exe
copy /Y "%~dp0.\serverConfig.cfg" "%armaDir%" > NUL 2>&1
if not [%errorlevel%] == [0]  (
	echo Unable to copy server-config. Press any key to exit...
	pause > NUL
	exit 1
)

:: Start the server and minimize it once it's started
start /min %exeName% -config=serverConfig.cfg -serverMod="%clib%;%opt%" -debugCallExtension
