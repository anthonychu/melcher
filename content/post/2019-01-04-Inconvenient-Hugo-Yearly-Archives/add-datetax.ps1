$files = get-childitem -Filter "*.md" -Path C:\git\melcherit\content\post -Recurse
$count = 0
foreach ($file in $files)
{

    if ($file.Name -eq "_index.md") { 
        continue
    }
  
    $lines = get-content $file.FullName -Encoding UTF8
    $found = $false

    foreach ($line in $lines)
    {
        if ($line -like "date:*")
        {
            $found = $true
            $date = $line.Replace("date:","")
            $count++

            $parsed = [DateTime]::Parse($date)
            
            $month = "{0:d2}" -f $parsed.Month
            $year = "$($parsed.Year): `"$month`""

            $lines = $lines[0..4],$year, $lines[5..($lines.Length -1)]
            $lines | Out-File $file.FullName -Encoding utf8
            break
            
        }
    }

    if (!$found)
    {
        write-host "date not found in file $($file.FullName)"
    }

    write-host $date
    
    
}

write-host $count