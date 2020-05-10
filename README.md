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

## General customisation (for all OSes)

## Firefox

### Changing the `Ctrl+F` (Finder) highlighting colour

1. Open Firefox.
2. In the URL (address) bar, type `about:config` and press the `Enter` key.
3. A warning message would turn up, ***Proceed with Caution***. Press the `Accept the Risk and Continue` button.
4. In the search bar that turns up in the new page, type `ui.textSelectBackgroundAttention`.
5. Change the default value type by clicking on the radio box labelled `String`.
6. Then click on the `+` button on the right hand side to input a HEX colour code (include the `#` symbol prefix).
7. That's it! Close the `about:config` page, and try out `Ctrl+F`. Your chosen colour should be displayed now :D

### Tutorial for creating userChrome styles for Firefox

Since there is no real help or documentation how to style the new  Firefox  Beta 57 I found a way how to live-debug the userChrome.css  file.

#### Create the userChrome.css

1. [Enable userChrome.css support in Fx v69+](https://www.reddit.com/r/FirefoxCSS/comments/brmi8v/psa_firefox_v69_users_will_have_to_set_a_pref_to/)
2. Open about:support
3. Click on "Profile Folder" -> "Open Folder"
4. Create a sub-folder named "chrome"
5. Change into the new folder
6. Create a file named "userChrome.css"
7. Add some rules
8. Restart Firefox

#### Live-Testing styles

##### Pre-setup

###### Before being able to try styles, you need to enable two developer options (only do this once). To do that:

1. Press Ctrl + Shift + I on Win/Linux or Cmd + Opt + I on Mac
2. Click on the cog that appears in a right or left top corner, next to other buttons.
3. Scroll down to Advanced Settings and check the settings "Enable  browser chrome and add-on debugging toolboxes" and "Enable remote  debugging".
4. Close the developer tools panel and proceed with next tutorial

###### Testing a style

1. Press Ctrl + Alt + Shift + I on Win/Linux or Cmd + Opt + Shift + I on Mac
2. A permission dialog will prompt you to allow remote debug, accept
3. Click on the tab Style Editor, choose file userChrome.css on the sidebar
4. Choose the style you want to preview from this repository, copy the code
5. Scroll down on the development tools window textbox, paste the code
6. You should see the style being applied. If you like what you see,  you can  click Save, otherwise it will disappear after restarting the  browser.

#### Styling Context Menus / Popups

from [/u/DanTheMan74](https://www.reddit.com/u/DanTheMan74/) The Firefox dev tools, when they're opened for remote debugging of the   browser content, have an extra option that's hidden behind the dropdown  at the top right, a thing which many people have no clue about.

The toggle is called Disable Popup Auto-Hide and it does exactly what it  says. By default Firefox (popup) menus disappear when you use the   element picker, but you can make them stay around by activating this   setting. This makes finding elements and their ids or classes much   simpler.

Reference: https://developer.mozilla.org/en-US/docs/Tools/Browser_Toolbox https://developer.mozilla.org/en-US/docs/Tools/Style_Editor

### Minimal Firefox userChrome style

[Minimal Functional Fox](https://github.com/mut-ex/minimal-functional-fox) or [Minimal Functional Fox (Fork)](https://github.com/tatsuei/minimal-functional-fox)