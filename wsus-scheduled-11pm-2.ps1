# Define the action to run Windows Update
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Install-Module PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -AutoReboot'

# Define the trigger to run daily at 11 PM
$trigger = New-ScheduledTaskTrigger -Daily -At 11:00PM

# Define the principal to run with highest privileges and whether the user is logged on or not
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Define the task settings
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Register the scheduled task
Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings $settings -TaskName "DailyWindowsUpdate" -Description "Updates Windows daily at 11 PM"
