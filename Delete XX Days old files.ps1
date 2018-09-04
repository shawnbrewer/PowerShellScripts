# the number of days old to delete 
$limit = (Get-Date).AddDays(-10)

# the directories where the objects you need to delete are 
# typically either log or cache files 
$path1 = "C:\program files\application\logs\"
$path2 = "C:\program files\application\cache\" 


# Delete files older than the $limit.
Get-ChildItem -Path $path1 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.LastwriteTime -lt $limit } | Remove-Item -Force -WhatIf 

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path1 -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse -WhatIf 

# Delete files older than the $limit.
Get-ChildItem -Path $path2 -Force | Where-Object { !$_.PSIsContainer -and $_.LastwriteTime -lt $limit } | Remove-Item -Force -WhatIf 

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path2 -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse -WhatIf 

