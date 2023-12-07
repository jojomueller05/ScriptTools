function Get-JsonConfig {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'leaf'})]
        [string]$Path
    )
        
    $file = Get-ChildItem $Path
    
    if ($file.Extension -eq ".json"){
        $json = Get-Content $Path -Raw | ConvertFrom-Json
        return $json
    } else {
        throw "Error given file $Path isn't Json Format!"
    }
}