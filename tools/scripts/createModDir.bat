:: This script creates a mod directory for a mod with the given name
:: Param 0: The name of the mod the directory should be created for
:: Param 1: Determines what kind of version of the mod the created directory should be for (This 
:: 				determines in which subdir the directory will be created). Can be [dev|release|both] Omitting this parameter
:: 					is equal to using the both argument

@echo off

:: check if there is a parameter given
if [%1] == [] (
	echo Missing argument in createModDir.bat
	exit 1
)

set modName=%1
set modVersion=%2

:: Create the base infrastructure
call %~dp0.\createBuildDirectories.bat

if [%modVersion%] == [] set modVersion=both
if [%modVersion%] == [dev] goto dev
if [%modVersion%] == [release] goto release

:: Create mod folders
:dev
if not exist "%~dp0.\..\..\PBOs\dev\@%modName%\" mkdir %~dp0.\..\..\PBOs\dev\@%modName%\
if not exist "%~dp0.\..\..\PBOs\dev\@%modName%\addons\" mkdir %~dp0.\..\..\PBOs\dev\@%modName%\addons\
if not exist "%~dp0.\..\..\PBOs\dev\@%modName%\keys\" mkdir %~dp0.\..\..\PBOs\dev\@%modName%\keys\

if not [%modVersion%] == [both] goto:eof
:release
if not exist "%~dp0.\..\..\PBOs\release\@%modName%\" mkdir %~dp0.\..\..\PBOs\release\@%modName%\
if not exist "%~dp0.\..\..\PBOs\release\@%modName%\addons\" mkdir %~dp0.\..\..\PBOs\release\@%modName%\addons\
if not exist "%~dp0.\..\..\PBOs\release\@%modName%\keys\" mkdir %~dp0.\..\..\PBOs\release\@%modName%\keys\