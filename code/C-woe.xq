<woe>
{
	let $mondial := "mondial-2015.xml"
    
    for $country in doc($mondial)/mondial/country
    where ($country/inflation) >5 and ($country/unemployment) > 10
	return 
		<country name='{$country/name/text()}'>
		{		
			let $inflation := $country/inflation			
				return $inflation,
			let $unemployment := $country/unemployment
				return $unemployment			
		}
		</country>		

}
</woe>


