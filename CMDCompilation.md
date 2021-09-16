# CMD 

## Directories

### Change working directory with eleveated permissions

`cd /d "your directory here without quotes"`

### Show files in all subdirectories

`dir /s` - shows files in all subdirectories

## Copy/Move Files

### Copy everything in "folder1" and paste it into "folder2".

`robocopy "source" "destination" "flags" ` e.g: `robocopy "c:/my folder" "d:/new folder" /E`

### Get everything in "folder1" and move into "folder2".

`robocopy "c:/mysourcefolder" "c:/mydestinationfolder" /E /MOVE`

## Removing files/folders

`rd "folder name" /s /q` 

- `/s` - Removes all files/folders in the selected folder and deletes the folder itself
- `/q` - Does the operation silently

