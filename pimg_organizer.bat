@echo off

REM ::: Pixiv Image Organizer
REM In conjunction with Pixiv Downloader: https://chrome.google.com/webstore/detail/pixiv-downloader/fnbkeopcpjainobjebddfcnnknmfipid
REM Usage: 
REM 1. In Pixiv Downloader Option, Use "$$$" to separate folder name and file name
REM 2. Download from Pixiv using Pixiv Downloader
REM 3. Update value of "dl_dir" in this script
REM 4. Run this script using Windows CMD



REM Set download directory 
REM CHANGE THIS if your download direcotry is different
REM set dl_dir=D:\~DOWNLOAD

REM Set folder name and file name delimiter
REM CHANGE THIS if you use a different direcotry
set delim=$$$


REM chdir /d %dl_dir%

setlocal enableextensions

REM dir /d %cd%\*%s%*

for /r %%f in (*%delim%*.*) do call :organize "%%f"
endlocal
goto :eof


:organize

set "fullpath=%~1"
REM echo %fullpath%

REM identidy filename from the full path
for /f "tokens=3 delims=\" %%a in ("%fullpath%") do set "filename=%%a"

REM identify folder name
for /f "tokens=1 delims=%delim%" %%a in ("%filename%") do set "foldername=%%a"

REM Create sub folder if not exist
if not exist "%cd%\%foldername%" (
	mkdir "%cd%\%foldername%"
	echo "Created directory %cd%\%foldername%"
)

REM identify file name
for /f "tokens=2 delims=%delim%" %%a in ("%filename%") do set "imagename=%%a"

REM move to folder
set "newpath=%cd%\%foldername%\%imagename%"
move /Y "%fullpath%" "%newpath%"


