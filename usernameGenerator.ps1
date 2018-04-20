
function TrimAndStripBadCharsFromName
{
param ($givenname,
        $sirname,
        [int]$count)


        # must be an easier way ?, but for now.
        # See if google helps later on.
        # Based on what i have seen mess upp other uid generators
        #



   $tempgn = $givenname.ToLower().Replace("å","a").Replace("ø","o").replace("æ","a") ##common norwegian
   $tempsn = $sirname.ToLower().Replace("å","a").Replace("ø","o").replace("æ","a") ##common norwegian


        # probably more to this?.
    $tempgn = $tempgn.Replace("ö","o") ##common Swedish
    $tempsn = $tempsn.Replace("ö","o")   ##common Swedish

        # Spanish ish
        # i guess
        # probably more

    $tempgn =  $tempgn.Replace("ã","a").Replace("õ","o") ##common Spanish ish
    $tempsn =  $tempsn.Replace("ã","a").Replace("õ","o")  ##common Spanish Ish

    

if($count -gt 0) {

            $returnvar = $tempgn.substring(0,$count)
            $returnvar += $tempsn.substring(0,$count)
            } else {
            $returnvar = $tempgn+$tempsn
            }



            $returnvar.Replace(" ","").Replace(".","").Replace(",","")


}
