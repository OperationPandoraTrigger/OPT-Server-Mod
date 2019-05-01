:: This script creates all directory infrastructure the build scripts will make use of
@echo off

:: create folder for produced PBOs if it doesn't exist yet
if not exist "..\..\PBOs\" mkdir ..\..\PBOs\
:: create respective subfolders if they don't exist yet
if not exist "..\..\PBOs\dev\" mkdir ..\..\PBOs\dev\
if not exist "..\..\PBOs\release\" mkdir ..\..\PBOs\release\
:: create archive folders for old PBOs
if not exist "..\..\PBOs\archive\" mkdir ..\..\PBOs\archive\
if not exist "..\..\PBOs\archive\dev\" mkdir ..\..\PBOs\archive\dev\
if not exist "..\..\PBOs\archive\release\" mkdir ..\..\PBOs\archive\release\