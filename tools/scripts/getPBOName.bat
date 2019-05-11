:: This script will determine the PBO-name based on a file's content (last line will be considered for that.
:: That line may either specify the name as pboName="<The name>" or if it doesn't follow this scheme the complete
:: last line will be taken as the name.
:: The given file will be preprocessed before examination so using macros in order to determine the PBO-name is fine.
:: This script will set the pboName variable that may be accessed in the calling script.

:: Param 0: The path to the file containing the pboName
:: Param 1: The default value that should be used when the extraction of the file fails (The file doesn't exist)

@echo off

set path=%1
set default=%2

if [%path%] == [] (
	:: if no path is given, use the default
	set pboName=%default%
	goto :end
)

if not exist "%path%" (
	:: if the given path doesn't exist, use the default
	set pboName=%default%
	goto :end
) else (
	:: preprocess the file into a local file called
	%~dp0\..\programs\armake2.exe preprocess -i %~dp0\..\..\dependencies\CLib\addons %path% internal_pboName.h.tmp
	
	:: read the last line of the file (contains the pboName spec)
	for /f "delims=" %%x in (internal_pboName.h.tmp) do set pboName=%%x
	
	:: delete the temp-file
	del internal_pboName.h.tmp /q
)


:end
:: replace double-quotes with single quotes as they don't mess up the script on expansion
set pboName=%pboName:"='%

if "%pboName:~0,9%" == "pboName='" (
	:: The pboName is given in the format pboName="<actualName>" -> trim to <actualName>
	set pboName=%pboName:~9,-1%
)

if not "%pboName:~4%" == ".pbo" (
	:: make sure the name actually ends with .pbo
	set pboName=%pboName%.pbo
)