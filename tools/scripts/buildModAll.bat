@echo off

set versionArg=%1

if [%versionArg%] == [] set versionArg=ask

call .\buildModCLib.bat %versionArg% buildModAll
call .\buildModOPT.bat %versionArg% buildModAll

if not [%2] == [noPause] pause