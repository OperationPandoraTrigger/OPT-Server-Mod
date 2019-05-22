:: This file copies the necessary mods into the respective arma-dir
@echo off

:: set meta info
call %~dp0.\.\setMetaData.bat

set "clibPath=%~dp0.\.\..\..\..\PBOs\dev\@CLib"
set "optPath=%~dp0.\.\..\..\..\PBOs\dev\@OPT"

if not exist %clibPath% (
	echo The CLib mod doesn't seem to exist. DId you forget to run buildMod?
	pause
	exit 1
)
if not exist %optPath% (
	echo The OPT mod doesn't seem to exist. DId you forget to run buildMod?
	pause
	exit 1
)


robocopy /E /IS /IT /R:60 /W:1 "%clibPath%" "%modDir%\@clib"
robocopy /E /IS /IT /R:60 /W:1 "%optPath%" "%modDir%\@opt"