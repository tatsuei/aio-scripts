Set DirName=%cd%
for %%I in (.) do echo %%~nxI
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%
rclone copy "%DirName%" "kenji-crypt:/music/%CurrDirName%/" -P -vv

