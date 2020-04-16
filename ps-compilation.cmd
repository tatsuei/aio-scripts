# Powershell Compilation 

1. Dives into each subfolder and appends the subfolder name to the original filename
   `$Files = Get-ChildItem -Path $Dir -Recurse -File`

   `ForEach ($File in $Files)
   {
        $FolderName = ((Split-Path -Path $File.FullName -Parent) -split '\\')[-1]
        $FileName = $File.Name
        Rename-Item -Path $File.FullName -NewName "${FolderName}_$FileName"
   }`

2. Filters out the JPEGs and PNGs in a folder and appends the folder name to the original filename 
   `Get-ChildItem | Where-Object { $_.Extension -eq ".jpg" -or $_.Extension -eq ".png" -and !$_.Name.StartsWith($_.Directory.Name) } | rename-item -newname {$_.Directory.Name +" - " + $_.Name} -WhatIf`

3. Replaces all defined characters with another character in the current folder
   `-literalpath` can be used to work with filenames containing special characters like square brackets "[" 
   `get-childitem | foreach {rename-item -literalpath $_ $_.name.replace("character here","")} -WhatIf`

4. For all zip files in the current directory i'll bash the spaces in and replace em with no spaces
   `get-childitem *.zip | foreach {rename-item -literalpath $_ $_.name.replace(" ","")}`

5.  For all JPEG and PNG files add a prefix and suffix to their filename
   `Get-ChildItem -Include *.jpg,*.png -Recurse | Rename-Item -NewName { 'Prefix' + $_.BaseName + 'Suffix' +  $_.Extension } -WhatIf`

6. `Get-ChildItem | Rename-Item -NewName { 'Prefix' + $_.BaseName + 'Suffix' +  $_.Extension } -WhatIf`

7. `Get-ChildItem | Rename-Item -NewName { "Prefix_" + $_.Name } -WhatIf`

8. `Get-ChildItem | Rename-Item -NewName {$_.Name + "Suffix_" + $_.Extension} -WhatIf`

9. // Change 1..X to what you want the folders to be called, e.g: `A..D`
   // Change `rs` to the prefix for the folder name
   // Replace `.\folderhere\` with your preferred directory
   `1..X | ForEach {MD ".\folderhere\rs$_"}`