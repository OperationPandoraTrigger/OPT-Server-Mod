:: This script creates a symlink for the unpacked OPT-Mod inside the ArmA-Directory.
:: Need to run only once if you dont mess with your directories.
:: This enables you to make changes in the unpacked mod-files from this repository
:: while the server is still running.
:: To reload live-changes on the server, let the server execute
:: execVM "@OPT\addons\OPT\TheChangedFile.sqf";
:: TODO! (I don't know how to let the server do this)
::
@echo off

:: set meta infos
CALL "%~dp0.\server\setMetaData.bat"

:: check if directory already exists
IF EXIST "%armaDir%\@OPT" (
	ECHO "%armaDir%\@OPT" already exists. Exiting...
	PAUSE
	EXIT 1
)

:: create symlink
MKDIR "%armaDir%\@OPT"
MKLINK /J "%armaDir%\@OPT\addons" "%~dp0..\..\addons"
PAUSE
