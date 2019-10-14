:: This script creates all directory infrastructure the build scripts will make use of

@echo off

:: create folder for produced PBOs if it doesn't exist yet
if not exist "%~dp0\..\..\PBOs\" mkdir "%~dp0\..\..\PBOs\"
:: create respective subfolders if they don't exist yet
if not exist "%~dp0\..\..\PBOs\dev\" mkdir "%~dp0\..\..\PBOs\dev\"
if not exist "%~dp0\..\..\PBOs\release\" mkdir "%~dp0\..\..\PBOs\release\"
:: create archive folders for old PBOs
if not exist "%~dp0\..\..\PBOs\archive\" mkdir "%~dp0\..\..\PBOs\archive\"
if not exist "%~dp0\..\..\PBOs\archive\dev\" mkdir "%~dp0\..\..\PBOs\archive\dev\"
if not exist "%~dp0\..\..\PBOs\archive\release\" mkdir "%~dp0\..\..\PBOs\archive\release\"
