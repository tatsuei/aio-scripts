# CMD 

## Directories

- `cd /d "your directory here without quotes"` - changes the working directory with elevated permissions
- `dir /s` - shows files in all subdirectories

## Copy/Move Files

- `robocopy "source" "destination" "flags" ` e.g: `robocopy "c:/my folder" "d:/new folder" /E` <- this copies everything in "my folder" 
- `robocopy "c:/mysourcefolder" "c:/mydestinationfolder" /E /MOVE` to move all folders to the new directory

## Removing files/folders

- `rd "folder name" /s /q` 
  - `/s` - Removes all files/folders in the selected folder and deletes the folder itself
  - `/q` - Does the operation silently

