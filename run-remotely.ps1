Set-AzContext -Subscription e079db37-8340-48ff-a64b-787f08b5e2e6 
Invoke-AzVmRunCommand `
     -ResourceGroupName "Rg-bastion-vms-qa" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath "/Users/fsparvie/Documents/GitHub/myscripts/Untitled/installchoco.ps1" 
