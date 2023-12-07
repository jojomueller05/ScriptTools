function Write-Logfile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(ValueFromPipeline=$true)]
        [string]$Message
    )
    $currentTime = Get-Date -Format "dd.mm.yyyy HH:mm:ss"

    $currentTime + " " + $Message | Out-File $Path
}

