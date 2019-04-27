:: This script creates a mod directory for a mod with the given name
@echo off

:: check if there is a parameter given
if [%1] == [] (
	echo Missing argument int createModDir.bat
	exit 1
)

set modName=%1
set modVersion=%2

:: Create the base infrastructure
call .\createBuildDirectories.bat

if [%modVersion%] == [] set modVersion=both
if [%modVersion%] == [dev] goto dev
if [%modVersion%] == [release] goto release

:: Create mod folders
:dev
if not exist "..\..\PBOs\dev\@%modName%\" mkdir ..\..\PBOs\dev\@%modName%\
if not exist "..\..\PBOs\dev\@%modName%\addons\" mkdir ..\..\PBOs\dev\@%modName%\addons\
if not exist "..\..\PBOs\dev\@%modName%\keys\" mkdir ..\..\PBOs\dev\@%modName%\keys\

if not [%modVersion%] == [both] goto:eof
:release
if not exist "..\..\PBOs\release\@%modName%\" mkdir ..\..\PBOs\release\@%modName%\
if not exist "..\..\PBOs\release\@%modName%\addons\" mkdir ..\..\PBOs\release\@%modName%\addons\
if not exist "..\..\PBOs\release\@%modName%\keys\" mkdir ..\..\PBOs\release\@%modName%\keys\