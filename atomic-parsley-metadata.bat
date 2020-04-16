// for = for loop
// /R = recursive search (search within all sub-directories)
// %%i = for loop variable
// %%~ni = keep only the filename

for /R "C:/FlutterDart" %%i in (*.mp4) do (AtomicParsley "%%i" --title "%%~ni" --overWrite)