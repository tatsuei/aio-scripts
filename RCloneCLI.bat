@echo off
Title Rclone Interactive CLI
Color 03


:initial
cls
Call :UploadFolder "Choose folder to upload"
echo You have chosen "%Location%"
if "%Location%"=="Dialog Cancelled" (
	CHOICE /N /C:YN /M "Press Y to choose a folder for upload, or N to quit."
	If ERRORLEVEL 2 goto two
	If ERRORLEVEL 1 goto initial
)
goto :start

:start
Set DirName=%Location%
echo %DirName%
for %%I in ("%DirName%") do echo %%~nxI
for %%I in ("%DirName%") do set CurrDirName=%%~nxI
echo "Which folder would you like to upload to?"
set /p folder=
echo %folder%

:choice
echo Are you sure you want to upload to this folder? (y/n)
set /p confirm=
echo %confirm%
if "%confirm%"=="y" (
	echo Okay I'll be starting the upload now!
	echo Beginning upload from "%DirName%" to "crypt-drive:/%folder%/%CurrDirName%/"! Please wait...
	rem rclone copy "%DirName%" "crypt-drive:/%folder%/%CurrDirName%/" -P -vv
)

if "%confirm%"=="n" (
:no
	echo Please choose another folder instead!
	set /p test=
	echo "Are you sure? (y/n)"
	set /p confirm2=
	echo %confirm2%
)
if "%confirm2%"=="n" (
	goto :no
)
if "%confirm2%"=="y" (
	echo Beginning upload from "%DirName%" to "crypt-drive:/%test%/%CurrDirName%/"! Please wait...
	rem rclone copy "%DirName%" "crypt-drive:/%test%/%CurrDirName%/" -P -vv
	echo "%DirName%" "crypt-drive:/%test%/%CurrDirName%/" -P -vv
)

:newUpload
echo Would you like to upload another file? (y/n)
CHOICE /N /C:YN /M "Press Y to choose another file, or N to quit."
If ERRORLEVEL 2 goto two
If ERRORLEVEL 1 goto initial

goto :newUpload

goto start
cmd /k

:two
exit

::***************************************************************************
:UploadFolder
set Location=
set vbs="%temp%\_.vbs"
set cmd="%temp%\_.cmd"
for %%f in (%vbs% %cmd%) do if exist %%f del %%f
for %%g in ("vbs cmd") do if defined %%g set %%g=
(
    echo set shell=WScript.CreateObject("Shell.Application"^) 
    echo set f=shell.BrowseForFolder(0,"%~1",0,"%~2"^) 
    echo if typename(f^)="Nothing" Then  
    echo wscript.echo "set Location=Dialog Cancelled"
    echo WScript.Quit(1^)
    echo end if 
    echo set fs=f.Items(^):set fi=fs.Item(^) 
    echo p=fi.Path:wscript.echo "set Location=" ^& p
)>%vbs%
cscript //nologo %vbs% > %cmd%
for /f "delims=" %%a in (%cmd%) do %%a
for %%f in (%vbs% %cmd%) do if exist %%f del /f /q %%f
for %%g in ("vbs cmd") do if defined %%g set %%g=
goto :eof
::***************************************************************************