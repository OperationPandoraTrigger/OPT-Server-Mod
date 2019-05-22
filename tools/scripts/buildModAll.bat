:: This script will build all Mods contained in this toolchain (currently the OPT mod itself and the CLib mod)
:: Param 0: Which version of the mods should be built. Possible values are [dev|release|both|ask] where ask has the same effect
:: as omitting this parameter: There will be an interactive prompt for each mod

@echo off

set versionArg=%1

if [%versionArg%] == [] set versionArg=ask

call %~dp0.\buildModCLib.bat %versionArg% buildModAll
call %~dp0.\buildModOPT.bat %versionArg% buildModAll

if not [%2] == [noPause] pause