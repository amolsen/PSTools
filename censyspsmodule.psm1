## censys basic module:
$apiid = "ApiID";
$secret = "ApiSecret"



function get-csAuthHeader {
    param([string]$myapiid = $apiid,
        [string]$myapisecret = $apisecret)

$pair = "${apiid}:${secret}"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair); $base64 = [System.Convert]::ToBase64String($bytes)

$basicAuthValue = "Basic $base64"; $headers = @{ Authorization = $basicAuthValue }

return $headers
}


function new-csquery {
    param([string]$csquery,
           $headers=$headers)    


    
$qtojson = @{query=$csquery;
             }

$get = Invoke-RestMethod https://censys.io/api/v1/search/ipv4 -Headers $headers -Method Post -Body ($qtojson | ConvertTo-Json)


return $get.results

}



