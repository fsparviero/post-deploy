# Define the task action
$action = New-ScheduledTaskAction -Execute 'choco' -Argument 'upgrade all -y -i'

# Define the trigger (at logon)
$trigger = New-ScheduledTaskTrigger -Daily -At 23:30

# Define the user account to run the task at the highest priviledges 
$principal = New-ScheduledTaskPrincipal -UserId "$(whoami)" -LogonType Interactive -RunLevel Highest 

# Register the scheduled task
Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName 'choco upgrade all daily at 11pm'
