<straddle>
{
	let $mondial := "mondial-2015.xml"
    
    for $country in doc($mondial)/mondial/country
    where count($country/encompassed) >1
	return 
		<country name='{$country/name/text()}'>
		{
			for $continent in $country/encompassed
			let $contname := $continent/@continent
				return <continent name ='{$contname}'/>
		}
		</country>		
}
</straddle>

