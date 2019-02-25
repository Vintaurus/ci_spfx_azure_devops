#################
# Configuration #
#################
Param(
    [string]$username, # => Office 365 Username
    [string]$psw, # => Office 365 Password
    [string]$site, # => SharePoint site for the installed app
    [string]$appId # => An app should be updated
)
#######
# End #
#######
Write-Host No problem reading $env:username or $username
Write-Host But I cannot read $env:psw
Write-Host But I can read $psw "(but the log is redacted so I do not spoil the secret)"

Write-Host **************************************** -ForegroundColor Yellow
Write-Host Update app                             * -ForegroundColor Yellow
Write-Host **************************************** -ForegroundColor Yellow
$sp = $psw | ConvertTo-SecureString -AsPlainText -Force
$plainCred = New-Object system.management.automation.pscredential -ArgumentList $username, $sp
Connect-PnPOnline $site -Credentials $plainCred
Update-PnPApp -Identity $appId