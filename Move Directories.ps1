### Un-comment the following line to get a list of directories from the main directory NO BACKSLASHES \
# Get-ChildItem -Path C:\Directory\sourceLocation | Set-Content C:\Directory\sourceLocation\directoryList.txt

$sourcePath = "C:\Directory\sourceLocation"
### don't use backslash \ at the end to copy contents
$destinationPath ="D:\Directory\destinationLocation" #no backslash as well to put in directory
### optional file names. to skip this, remove the -Filter option in the bellow script. this comes in hand if you have a lot of directories, especially if you ran the above script and got a list of directory names 
# $directoriesContain = "*specialName*" 


Get-ChildItem -Path $sourcePath | Move-Item -destination $destinationPath -Verbose 
#  Get-ChildItem -Path $sourcePath -Filter $directoriesContain | Move-Item -destination $destinationPath -Verbose  


###   Without any of the above varialbles 
# Get-ChildItem -Path "C:\Directory\sourceLocation" -Filter "specialName*" | Move-Item -destination "D:\Directory\destinationLocation"

###   Format to pop out a new PowerShell window to speed up the move 
# start powershell.exe "Get-ChildItem -Path 'C:\Directory\sourceLocation' -Filter '*specialName1*' | Move-Item -destination 'D:\Directory\destinationLocation' -Verbose"
# start powershell.exe "Get-ChildItem -Path 'C:\Directory\sourceLocation' -Filter '*specialName2*' | Move-Item -destination 'D:\Directory\destinationLocation' -Verbose"
# start powershell.exe "Get-ChildItem -Path 'C:\Directory\sourceLocation' -Filter '*specialName3*' | Move-Item -destination 'D:\Directory\destinationLocation' -Verbose"
