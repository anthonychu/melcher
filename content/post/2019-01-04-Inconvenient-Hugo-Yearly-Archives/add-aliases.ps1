$files = get-childitem -Filter "*.md" -Path C:\git\melcherit\content\post -Recurse

foreach ($file in $files)
{
    if ($file.Name -eq "_index.md")
    {
        write-host "skip _index.md"
        continue
    }
    elseif ($file.Name -eq "index.md")
    {
        $filename = $(get-item $file.FullName).Directory.Name
    }
    else {
        write-host $file.Name
        $filename = $file.Name.Substring(0, $file.Name.LastIndexOf("."))
    }

    $lines = get-content $file.FullName -Encoding UTF8
    $alias = "aliases:"
    $url = "   - `"/post/$filename/`""

    if ($lines[3] -like "aliases*")
    {
        $lines[3] = $alias
        $lines[4] = $url
    }
    else {
        $lines = $lines[0..(2)],$alias, $url, $lines[3..($lines.Length -1)]
    }
    $lines | Out-File $file.FullName -Encoding utf8
}