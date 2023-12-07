# ScriptTools Powershell Module
This Powershell Module provides some helpful Functions to get startet with a new Powershell Script Project. 

```
Import-Module <ModulePath> -Force

Get-Command -Module ScriptTools
```
## Initialize-PSScript
This function generates a Folder Structure for your next Powershell script project.

## Get-JsonConfig
This function reads a json Config file.
```
$config = Get-JsonConfig -Path .\etc\config.json
```
## Write-Logfile
Helps you creating a beautiful Logfile.
```
Write-Logfile -Path .\var\logfile.txt -Message "Created AD user"
```