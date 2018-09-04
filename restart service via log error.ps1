# Name of Service as displayed in Services 
$serv1 = "Service One Service" 
# the log where you're monitoring that produces errors 
Get-Content 'C:\application\log\servicelog.log' -Tail 11 | ForEach-Object { # number of lines which to read log error 

if ($_ -like "*unknown_error*" )  # the text or error that the log produces, which means it needs to be restarted 
    { Stop-Service -Name $serv1 -Force }
    } 
# FYI it's best not to 'restart' services, but rather to STOP and START it
# so if the service happened to crash and stop, it will now start 
$A = get-service $serv1
if ($A.Status -eq "Stopped") {$A.start()} 

