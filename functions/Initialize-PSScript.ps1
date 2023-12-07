function Initialize-PSScript{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'Container'})]
        [string]$Path,
        [string]$Name,
        [ValidateScript({
            try{
                    git | Out-Null
                    "Git is installed"
            }
            catch [System.Management.Automation.CommandNotFoundException]{
                    "No git"
            }
        })]
        [bool]$GitInit
    )
    $Location = Get-Location
    $ProjectFolder = "$Path\$Name"

    New-Item -ItemType Directory -Path $ProjectFolder
    # Create Bin Dir
    New-Item -ItemType Directory -Path "$ProjectFolder\bin"   
    # Create main.ps1
    New-Item -ItemType File -Path "$ProjectFolder\bin\main.ps1"


    # Create ETC Dir
    New-Item -ItemType Directory "$ProjectFolder\etc"
        # Create functions Dir
        New-Item -ItemType Directory -Path "$ProjectFolder\etc\functions"
        # Create Classes
        New-Item -ItemType Directory -Path "$ProjectFolder\etc\Classes"
        # Create config.json
        New-Item -ItemType File -Path "$ProjectFolder\etc\config.json"

    #Create VAR Dir
    New-Item -ItemType Directory -Path "$ProjectFolder\var"
        # Create Logfile.txt
        New-Item -ItemType File -Path "$ProjectFolder\var\logfile.txt"
    
    # Create Readme.md
    $ReadmeHeader = "# $Name"

    $ReadmeHeader | Out-File -FilePath "$ProjectFolder\README.md"

    if ($GitInit -eq $true){
        Set-Location -Path $ProjectFolder
        git init
        Set-Location -Path $Location
    }
}