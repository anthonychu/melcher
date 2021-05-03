Param(    
    [Parameter(Mandatory = $true)]    
    [string]$folder  
)    

$libPath = "cwebp.exe"
  
$files = get-childitem $folder -recurse -force -include *.jpg, *.png
foreach ($inputFile in $files) {   

    #Call cwebp
    $inputFilePath = $inputFile.FullName
    $outputFilePath = Split-Path -Path $inputFile.FullName
    $outputFilePath = $outputFilePath + "\" + [System.IO.Path]::GetFileNameWithoutExtension($inputFilePath) + ".webp"

    Write-Host $inputFile.Name
    if (Get-ChildItem -Path $outputFilePath -ErrorAction SilentlyContinue)
    {
        continue;
    }

    & cwebp.exe -q 80 -short $inputFilePath -o $outputFilePath
}
    