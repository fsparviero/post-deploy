# Define the action to run Windows Update
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Install-Module PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -AutoReboot'

# Define the trigger to run daily at 11 PM
$trigger = New-ScheduledTaskTrigger -Daily -At 11:00PM

# Define the task settings
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Register the scheduled task
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "DailyWindowsUpdate" -Description "Updates Windows daily at 11 PM"
