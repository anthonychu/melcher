$params = @{
 "api-key"="[ADMIN KEY]";
}

Invoke-WebRequest -Uri https://[SERVICE NAME].search.windows.net/indexers/[INDEXER NAME]/run?api-version=2017-11-11 -Method POST -Headers $params