$url = "https://dev.azure.com/mmelcher/8036eca1-fd9e-4c0f-8bef-646b32fbda0b/_apis/git/repositories/e08d1ada-7794-4b89-a3ea-cb64a26683c3/Items?path=%2Fazuredevops-export-wiki.exe"

$output = "azuredevops-export-wiki.exe"

Invoke-WebRequest -Uri $url -OutFile $output
./azuredevops-export-wiki.exe -v -b -d