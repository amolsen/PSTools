<# 

 .Synopsis
  Displays a Mac address vendor for given MAC address

 .Description
  Displays a visual representation of a calendar. This function supports multiple months
  and lets you highlight specific date ranges or days.


#>



function get-vendor {
    param(
    [parameter(Mandatory=$true)]
    $macaddr)

    $uri = "http://www.coffer.com/mac_find/?string=$macaddr"

            $macsearchresult = Invoke-WebRequest -Uri $uri

            $vendor = ($macsearchresult.ParsedHtml.getElementsByTagName("td") | Where{ $_.className -eq ‘Table2’ }).innerText
            Write-Output "MAC search for "

            Write-Warning "$vendor"

            }