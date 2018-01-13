<buddhist>
{
	let $mondial := "mondial-2015.xml"
    
    for $country in doc($mondial)/mondial/country
    where $country/religion='Buddhist' 
    let $bud := $country/religion[text()='Buddhist']/@percentage
	return 
		<country name='{$country/name/text()}' percentage='{$bud}' /> 		
		
		
}
</buddhist>

