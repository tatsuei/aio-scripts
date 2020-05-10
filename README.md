# Scripts
A collection of PowerShell, CMD, and terminal (*nix) commands

## What's in this repo?
- Batch files for zipping multiple folders (putting the contents into a folder or just straightup zipping the contents )
- Shell commands for Android animation scales (window, transition, animator) 
- Powershell commands to rename multiple filenames
- Powershell commands to add pre/suffixes to file/folder names
- Powershell commands to create multiple folders
- How to change VLC's absolute playlist paths to relative ones
- How to convert videos using FFMPEG
- How to install rclone.exe as a Windows Service (either System or User service)
- Batch file to convert multiple images using Inkscape (primarily .svg to .png)
## How to navigate this repo? 
Click on the links below!

[toc] 

## Links

[Add metadata to MP4s (Windows)](https://github.com/tatsuei/Scripts/blob/master/atomic-parsley-metadata.bat) - Use AtomicParsley to add metadata (Title, Artist, etc.) to MP4s.

[VLC Compilation](https://github.com/tatsuei/Scripts/blob/master/vlc-compilation.md) - A list of various settings/parameters related to VLC

[CMD Compilation](https://github.com/tatsuei/Scripts/blob/master/cmd-compilation.md) - A current list of all the commands I've used in the past  

[Convert Images](https://github.com/tatsuei/Scripts/blob/master/convert-images.bat) - A batch file to convert multiple images from one format to another 

[FFMPEG Compilation](https://github.com/tatsuei/Scripts/blob/master/ffmpeg-compilation.md) - A list of various commands for FFMPEG

[Powershell Compilation](https://github.com/tatsuei/Scripts/blob/master/ps-compilation.cmd) - A collection of all the useful PowerShell commands and one-liners I've found over the years.

[Rclone Sync - Manga](https://github.com/tatsuei/Scripts/blob/master/rclone-manga.bat) - A Windows batch file for syncing comics using Rclone

[Rclone Sync - Music](https://github.com/tatsuei/Scripts/blob/master/rclone-music.bat) - A Windows batch file for syncing music using Rclone

[Rclone Sync - Videos](https://github.com/tatsuei/Scripts/blob/master/rclone-videos.bat) - A Windows batch file for syncing videos using Rclone

## Add metadata to MP4s (Windows)

```
// for = for loop
// /R = recursive search (search within all sub-directories)
// %%i = for loop variable
// %%~ni = keep only the filename

for /R "C:/FlutterDart" %%i in (*.mp4) do (AtomicParsley "%%i" --title "%%~ni" --overWrite)
```

## CMD Compilation

### Directories

- `cd /d "your directory here without quotes"` - changes the working directory with elevated permissions
- `dir /s` - shows files in all subdirectories

### Copy/Move Files

- `robocopy "source" "destination" "flags" ` e.g: `robocopy "c:/my folder" "d:/new folder" /E` <- this copies everything in "my folder"
- `robocopy "c:/mysourcefolder" "c:/mydestinationfolder" /E /MOVE` to move all folders to the new directory

### Removing files/folders

- `rd "folder name" /s /q`
  - `/s` - Removes all files/folders in the selected folder and deletes the folder itself
  - `/q` - Does the operation silently

## Inkscape image conversion (batch file)

```
@Echo off

set "inkscapePath=C:\Program Files\Inkscape\inkscape.exe"
set /a count=0
set validInput1=svg
set validInput2=pdf
set validInput3=eps
set validOutput1=eps
set validOutput2=pdf
set validOutput3=png

echo This script allows you to convert all files in this folder from one file type to another.

set valid=0
echo Allowed file types for source: %validInput1%, %validInput2%, %validInput3%

:whileInNotCorrect
	set /p sourceType=What file type do you want to use as a source?
	if "%sourceType%" EQU "%validInput1%" set valid=1
	if "%sourceType%" EQU "%validInput2%" set valid=1
	if "%sourceType%" EQU "%validInput3%" set valid=1
	if %valid% EQU 0 (
		echo Invalid input! Please use one of the following: %validInput1%, %validInput2%, %validInput3%
		goto :whileInNotCorrect
	)

set valid=0
echo Allowed file types for output: %validOutput1%, %validOutput2%, %validOutput3%      
:whileOutNotCorrect
	set /p outputType=What file type do you want to convert to?
	if "%outputType%" EQU "%validOutput1%" set valid=1
	if "%outputType%" EQU "%validOutput2%" set valid=1
	if "%outputType%" EQU "%validOutput3%" set valid=1
	if %valid% EQU 0 (
		echo Invalid input! Please use one of the following: %validOutput1%, %validOutput2%, %validOutput3%   
		goto :whileOutNotCorrect
	)

:: Set DPI for exported file
set /p dpi=With what dpi should it be exported (e.g. 300)?

:: Running through all files found with the defined ending
for %%i in (.\*.%sourceType%) do (
	set /a count=count+1
	echo %%i to %%~ni.%outputType%
	"%inkscapePath%" --without-gui --file="%%i" --export-%outputType%="%%~ni.%outputType%" --export-dpi=%dpi%
)
   
echo %count% file(s) converted from %sourceType% to %outputType%!
   
pause
```