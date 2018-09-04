# establish the directory and filename of the log or txt files
# put an asterisk if a date or number is at the end of the filenames  
Get-Content C:\application\log\LogFileName2018*.log | ForEach-Object {

    if ($_ -like "*error*") # this is the text you're looking for 
        {
                $_
                }
                }  | Set-Content C:\application\log\errors.txt # this text file is created with each instance of the words you searched for 

