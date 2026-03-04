# autopilotreg.osdcloud.ch
$Title = "Add device to Autopilot"
$host.UI.RawUI.WindowTitle = $Title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
$env:APPDATA = "C:\Windows\System32\Config\SystemProfile\AppData\Roaming"
$env:LOCALAPPDATA = "C:\Windows\System32\Config\SystemProfile\AppData\Local"
$Env:PSModulePath = $env:PSModulePath+";C:\Program Files\WindowsPowerShell\Scripts"
$env:Path = $env:Path+";C:\Program Files\WindowsPowerShell\Scripts"

$Global:Transcript = "$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-AddToAutopilot.log"
Start-Transcript -Path (Join-Path "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\OSD\" $Global:Transcript) -ErrorAction Ignore

Write-Host "Adding device to Autopilot" -ForegroundColor Green

Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
Install-Module -Name Get-WindowsAutopilotInfo -Force -Verbose
Get-WindowsAutoPilotInfo -Online -TenantId '7891a292-cac1-43a3-84c9-af61ca7e4445' -AppId '1ecea92f-2e8d-4772-8d81-5fba68b86b95' -AppSecret 'Ecf8Q~kExB7Vjzpb-Hf3ydFEvzbHJo6IjShBkarR' -GroupTag 'RITA' -Assign

Stop-Transcript

Write-Host -ForegroundColor Green "Running Autopilot Assignment"
