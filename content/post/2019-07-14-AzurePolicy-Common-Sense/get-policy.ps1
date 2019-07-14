$policy = az policy definition list | ConvertFrom-Json
$preview = 0
$normal = 0
foreach ($p in $policy | sort -Property "displayName")
{
    if ($p.displayName -like "*Deprecated*")
    {
        continue
    }
    "| $($p.displayName) | $($p.description) |" | add-content policies.txt

    if ($p.displayName -like "*Preview*")
    {
        $preview++
    }
    else {
        $normal++
    }
}

write-host "normal: $normal"
write-host "preview: $preview"