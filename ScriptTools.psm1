# Get all .ps1 files in Functions
$Functions = $PSScriptRoot + "\Functions"
$FunctionsFiles = Get-Childitem -Path $Functions 

# source all in
foreach ($FunctionFile in $FunctionsFiles) {
    if ($FunctionFile.Extension -eq ".ps1"){
        . $FunctionFile.FullName

    }
}